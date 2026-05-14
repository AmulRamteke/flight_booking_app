import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../constants/api_constants.dart';
import 'api_failure.dart';
import 'network_info.dart';

final cacheOptionsProvider = FutureProvider<CacheOptions>((ref) async {
  final dir = await getTemporaryDirectory();
  return CacheOptions(
    store: HiveCacheStore(dir.path),
    policy: CachePolicy.refreshForceCache,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 7),
    priority: CachePriority.normal,
  );
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 4),
      ],
    ),
  );

  // Logging
  dio.interceptors.add(
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ),
  );

  return dio;
});

class DioClient {
  final Dio _dio;
  final Ref _ref;

  DioClient(this._dio, this._ref);

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      await _checkConnectivity();

      final cacheOptions = await _ref.read(cacheOptionsProvider.future);
      final mergedOptions = options ?? Options();
      mergedOptions.extra ??= {};
      mergedOptions.extra!.addAll(cacheOptions.toExtra());

      return await _dio.get(
        url,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw e.toApiFailure();
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      await _checkConnectivity();

      return await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw e.toApiFailure();
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  Future<void> _checkConnectivity() async {
    final status = _ref.read(networkStatusProvider);
    if (status == NetworkStatus.disconnected) {
      throw NetworkFailure();
    }
  }
}

final apiClientProvider = Provider<DioClient>((ref) {
  return DioClient(ref.read(dioProvider), ref);
});

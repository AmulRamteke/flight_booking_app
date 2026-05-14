import 'package:dio/dio.dart';

class ApiFailure implements Exception {
  final String message;
  final int? statusCode;

  ApiFailure(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class NetworkFailure extends ApiFailure {
  NetworkFailure() : super('No internet connection. Please check your network.');
}

class ServerFailure extends ApiFailure {
  ServerFailure({int? statusCode}) 
    : super('Server error occurred. Please try again later.', statusCode: statusCode);
}

class TimeoutFailure extends ApiFailure {
  TimeoutFailure() : super('Request timed out. Please try again.');
}

class AuthFailure extends ApiFailure {
  AuthFailure() : super('Authentication failed. Please login again.', statusCode: 401);
}

class ValidationFailure extends ApiFailure {
  ValidationFailure(String message) : super(message, statusCode: 400);
}

extension DioExceptionX on DioException {
  ApiFailure toApiFailure() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure();
      case DioExceptionType.badResponse:
        final status = response?.statusCode;
        if (status == 401 || status == 403) return AuthFailure();
        if (status != null && status >= 500) return ServerFailure(statusCode: status);
        
        final errorMessage = response?.data?['error'] ?? response?.data?['message'] ?? 'Something went wrong';
        return ValidationFailure(errorMessage);
      case DioExceptionType.connectionError:
        return NetworkFailure();
      default:
        return ApiFailure('An unexpected error occurred');
    }
  }
}

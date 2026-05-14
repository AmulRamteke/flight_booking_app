import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PreferencesService {
  final Box _box;

  PreferencesService(this._box);

  static const String _boxName = 'preferences';
  static const String _keyThemeMode = 'theme_mode';
  static const String _keyLastSearch = 'last_search';

  static Future<PreferencesService> init() async {
    final box = await Hive.openBox(_boxName);
    return PreferencesService(box);
  }

  Future<void> setThemeMode(String mode) async {
    await _box.put(_keyThemeMode, mode);
  }

  String? getThemeMode() {
    return _box.get(_keyThemeMode);
  }

  Future<void> setLastSearch(Map<String, dynamic> search) async {
    await _box.put(_keyLastSearch, search);
  }

  Map<String, dynamic>? getLastSearch() {
    final data = _box.get(_keyLastSearch);
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }
}

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  throw UnimplementedError('Initialize this provider in main.dart');
});

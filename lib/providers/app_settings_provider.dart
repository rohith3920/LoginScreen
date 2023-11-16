import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sleektask/providers/secure_storage_provider.dart';
import 'package:sleektask/utils/presentations/get_it.dart';

class AppSettingsProvider with ChangeNotifier {
  final _secureStorageProvider = getSingleton<SecureStorageProvider>();
  bool _isDark = false;

  bool get isDark => _isDark;

  void setup() async {
    _isDark = (await _secureStorageProvider.read(key: 'darkMode') ?? 'false') ==
        'true';
    notifyListeners();
  }

  void toggleTheme() async {
    _isDark = !_isDark;
    await _secureStorageProvider.add(
        key: 'darkMode', value: _isDark.toString());
    notifyListeners();
  }
}

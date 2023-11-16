// import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sleektask/providers/environments.dart';
import 'package:sleektask/providers/logger.dart';
// import 'package:flutter/services.dart';

class AppConfigProvider {
  // late Map<String, dynamic> _configurationFile;
  // final _secureStorageProvider = getSingleton<SecureStorageProvider>();
  late String _appVersion;
  late String _appVersionNormalizedString;
  late String _environment;
  String? _apiUrl;
  late GlobalKey<NavigatorState> _navigatorKey;
  late void Function(
    String? message,
    bool showHideButton,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
    Duration? duration,
    Widget? suffix,
    Widget? prefix,
  ) _globalSnackbar;

  String get apiBaseUrl => _apiUrl ?? "";

  String get environment => _environment;
  String get appVersion => _appVersion;
  String get appVersionNormalizedString => // _appVersionNormalizedString;
      "1.0";
  String get platform => Platform.operatingSystem;
  String get applicationType => 'tsts';
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  void Function(
    String? message,
    bool showHideButton,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
    Duration? duration,
    Widget? suffix,
    Widget? prefix,
  ) get globalSnackbar => _globalSnackbar;

  Future<void> loadConfig() async {
    try {
      const mode = String.fromEnvironment('ENVIRONMENT',
          defaultValue: Environments.prod);

      _environment = mode;
      // _configurationFile =
      //     jsonDecode(await rootBundle.loadString('assets/configs/$mode.json'));
      // _appVersion = getSingleton<AppInfoProvider>().appVersion;
      _appVersionNormalizedString = _appVersion.split('.').join('');

      String forceOverrideAppVersion = String.fromEnvironment('APP_VERSION',
          defaultValue: _appVersionNormalizedString);

      if (forceOverrideAppVersion.isNotEmpty) {
        _appVersionNormalizedString = forceOverrideAppVersion;
      }
    } catch (e, st) {
      logES(e, st);
    }
  }

  // Future loadBaseUrl() async {
  //   _apiUrl = await _secureStorageProvider.getIPAddressFromDisk();
  // }

  void setNavigatorKey(key) {
    _navigatorKey = key;
  }

  void setGlobalSnackbar(
      void Function(
        String? message,
        bool showHideButton,
        SnackBarAction? action,
        SnackBarBehavior? behavior,
        Duration? duration,
        Widget? suffix,
        Widget? prefix,
      ) globalSnackbar) {
    _globalSnackbar = globalSnackbar;
  }
}

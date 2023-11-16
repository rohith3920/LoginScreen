import 'package:get_it/get_it.dart';
import 'package:sleektask/providers/app_config_provider.dart';
import 'package:sleektask/providers/secure_storage_provider.dart';
import 'package:sleektask/utils/presentations/easy_localization.dart';

final _serviceLocator = GetIt.instance;

Future<void> _setupProviders() async {
  _serviceLocator
      .registerSingleton<SecureStorageProvider>(SecureStorageProvider());
  _serviceLocator.registerSingleton<AppConfigProvider>(AppConfigProvider());
  _serviceLocator
      .registerSingleton<EasyLocalizationProvider>(EasyLocalizationProvider());
}

Future<void> _setupConfig() async {
  await _serviceLocator.get<AppConfigProvider>().loadConfig();
  await _serviceLocator.get<SecureStorageProvider>().loadPreferences();
  // await _serviceLocator.get<ConnectivityProvider>().initialize();
  await _serviceLocator.get<EasyLocalizationProvider>().ensureInitialized();
  // await _serviceLocator.get<CrashlyticsProvider>().registerError();
}

Future<void> setupResources() async {
  await _setupProviders();
  await _setupConfig();
  // await _setupRepositories();
  // await _serviceLocator.get<SecureStorageProvider>().removeAllKeys();
}

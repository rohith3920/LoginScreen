import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sleektask/Translations/locale_keys.dart';
import 'package:sleektask/bloc/login_bloc/login_bloc.dart';
import 'package:sleektask/multi_bloc_provider.dart';
import 'package:sleektask/providers/app_config_provider.dart';
import 'package:sleektask/providers/app_settings_provider.dart';
import 'package:sleektask/utils/presentations/get_it.dart';
import 'package:sleektask/utils/presentations/helpers.dart';
import 'package:sleektask/utils/presentations/routes.dart';

import 'utils/presentations/bloc_provvider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final AppConfigProvider _configProvider = getSingleton<AppConfigProvider>();

  void globalSnackbar(String? message, bool showHideButton) {
    ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message ?? '',
        ),
        action: showHideButton
            ? SnackBarAction(
                label: LocaleKeys.login.translate(),
                onPressed: () {
                  ScaffoldMessenger.of(_navigatorKey.currentContext!)
                      .hideCurrentSnackBar();
                },
              )
            : null,
        duration: const Duration(seconds: 3),
        elevation: 4,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppSettingsProvider appSettingsProvider =
        getProvider<AppSettingsProvider>(context);

    _configProvider.setNavigatorKey(_navigatorKey);
    // _aliceProvider.setNavigatorKey();
    // _configProvider.setGlobalSnackbar(globalSnackbar);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: const [
          Locale('en', ''),
        ],
        locale: context.locale,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginScreen,
        onGenerateRoute: WorkForceRouter.generateRoute,
        themeMode:
            appSettingsProvider.isDark ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}

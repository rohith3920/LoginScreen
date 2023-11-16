import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleektask/app.dart';
import 'package:sleektask/providers/app_settings_provider.dart';

import 'package:sleektask/utils/presentations/easy_localization.dart';
import 'package:sleektask/utils/presentations/get_it.dart';
import 'package:sleektask/utils/presentations/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalizationProvider().ensureInitialized();
  await setupResources();
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        getSingleton<EasyLocalizationProvider>().easyLocalization(
          path: 'assets/Translations',
          supportedLocales: [const Locale('en', '')],
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) => AppSettingsProvider()..setup()),
            ],
            child: const App(),
          ),
        ),
      );
    },
    // ignore: no-empty-block
    (Object error, StackTrace stack) {
      // logES(error, stack);
    },
    // zoneSpecification: ZoneSpecification(
    //   // Intercept all print calls
    //   print: (self, parent, zone, line) async {
    //     // Include a timestamp and the name of the App
    //     final messageToLog = "[${DateTime.now()}] $line $zone";
    //     // privacy prohibited stuff
    //     parent.print(zone, messageToLog);
    //   },
    // ),
  );
}

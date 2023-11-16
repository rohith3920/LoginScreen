import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../Translations/codegen_loader.dart';

class EasyLocalizationProvider {
  Future<void> ensureInitialized() async {
    await EasyLocalization.ensureInitialized();
  }

  Widget easyLocalization({
    required Widget child,
    required List<Locale> supportedLocales,
    required String path,
    Locale? fallbackLocale,
  }) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: path,
      fallbackLocale: fallbackLocale ?? const Locale('en', ''),
      assetLoader: const CodegenLoader(),
      child: child,
    );
  }

  String translate(String? data, Map<String, String>? namedArgs) {
    return tr(
      data ?? '',
      namedArgs: namedArgs,
    );
  }
}

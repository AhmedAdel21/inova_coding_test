import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:inova_coding_test/app/app.dart';
import 'package:inova_coding_test/app/di.dart';

import 'presentation/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DI.initAppModule();
  runApp(EasyLocalization(
    supportedLocales: const [LanguageLocaleConstant.englishLocale],
    path: assetsPathLocalization,
    child: Phoenix(child: MyApp()),
  ));
}

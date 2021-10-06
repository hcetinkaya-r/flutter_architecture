import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/authentication/test/view/test_view.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.LANG_ASSET_PATH,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: TestView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}

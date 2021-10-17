import 'package:flutter/material.dart';
import '../../constants/app/app_constants.dart';

import 'app_theme.dart';

import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme(),
        textTheme: textTheme(),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        fontFamily: AppConstants.FONT_FAMILY,
        tabBarTheme: tabBarTheme(),
      );

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
        labelPadding: paddingInsets.lowPaddingAll,
        unselectedLabelStyle:
            textThemeLight!.headline4.copyWith(color: colorSchemeLight!.gray),
      );
  }

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight!.headline1,
      headline2: textThemeLight!.headline2,
      overline: textThemeLight!.headline3,
    );
  }

  ColorScheme _appColorScheme() {
    return ColorScheme(
        primary: colorSchemeLight!.black,
        primaryVariant: Colors.white,
        secondary: Colors.green,
        secondaryVariant: Colors.green.shade200,
        surface: Colors.blue,
        background: Colors.white30,
        error: Colors.red.shade200,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black38,
        onSurface: Colors.white30,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.light);
  }
}

import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme{
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
     return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();

 
}

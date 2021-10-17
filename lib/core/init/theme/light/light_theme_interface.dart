import 'package:flutter_uygulama_mimarisi/core/init/theme/light/padding_insets.dart';

import 'color_scheme_light.dart';
import 'text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight? textThemeLight = TextThemeLight.instance;
  ColorSchemeLight? colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets paddingInsets = PaddingInsets();
}

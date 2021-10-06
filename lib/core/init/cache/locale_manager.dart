import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/preferences_keys_enum.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();
  late SharedPreferences? _preferences;

  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();

    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) => _preferences?.getString(key.toString()) ?? "";
}

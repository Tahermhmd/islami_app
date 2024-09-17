import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static late SharedPreferences pref;

  static String? getLanguage() {
    return pref.getString("newLocale");
  }

  static saveLanguage(String language) async {
    return await pref.setString("newLocale", language);
  }

  static saveMode(String mode) async {
    return await pref.setString("mode", mode);
  }

  static String? getMode() {
    return pref.getString("mode") ?? "light";
  }
}

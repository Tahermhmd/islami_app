import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../preference/preference.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocal = "en";

  ThemeMode currentTheme = ThemeMode.light;

  void intial() async {
    String? newlocale = Preference.getLanguage();
    setCurrentLocale(newlocale ?? "en");
    String? mode = Preference.getMode();
    if (mode == "dark") {
      setCurrentTheme(ThemeMode.dark);
    } else {
      setCurrentTheme(ThemeMode.light);
    }
  }

  void setCurrentLocale(String newLocale) {
    currentLocal = newLocale;
    Preference.saveLanguage(newLocale);
    notifyListeners();
  }

  void setCurrentTheme(ThemeMode newThemeMode) {
    currentTheme = newThemeMode;
    if (newThemeMode == ThemeMode.dark) {
      Preference.saveMode("dark");
    } else {
      Preference.saveMode("light");
    }
    notifyListeners();
  }

  bool isDarkMode() => currentTheme == ThemeMode.dark;
}

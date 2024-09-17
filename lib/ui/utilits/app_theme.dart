import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final TextStyle appBarTitleTextStyle = TextStyle(
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: AppColors.accent);

  static final TextStyle quranTabTitleTextStyle = TextStyle(
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 25,
      color: AppColors.accent);

  static final TextStyle settingsTitleTextStyle = TextStyle(
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 25,
      color: AppColors.accent);

  static final TextStyle settingsOptionTextStyle = TextStyle(
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: AppColors.accent);
  static final ButtonStyle radioButtonStyle = ButtonStyle(
      iconColor: MaterialStateProperty.all<Color?>(AppColors.primary));

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary, foregroundColor: AppColors.white),
      primaryColor: AppColors.primary,
      dividerTheme:
          const DividerThemeData(thickness: 3, color: AppColors.primary),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: appBarTitleTextStyle),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primary,
          selectedItemColor: AppColors.accent,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 27)),
      textTheme: TextTheme(
        bodySmall: settingsOptionTextStyle,
        bodyMedium: settingsTitleTextStyle,
        bodyLarge: appBarTitleTextStyle,
        displayMedium: quranTabTitleTextStyle,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(AppColors.primary),
          iconColor: MaterialStateProperty.all<Color?>(AppColors.primary),
        ),
      ));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.white),
    primaryColor: AppColors.primaryDark,
    dividerTheme:
        const DividerThemeData(thickness: 3, color: AppColors.accentDark),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: appBarTitleTextStyle.copyWith(color: AppColors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDark,
        selectedItemColor: AppColors.accentDark,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 27)),
    textTheme: TextTheme(
      bodySmall: settingsOptionTextStyle.copyWith(color: AppColors.white),
      bodyMedium: settingsTitleTextStyle.copyWith(color: AppColors.white),
      bodyLarge: appBarTitleTextStyle.copyWith(color: AppColors.white),
      displayMedium: quranTabTitleTextStyle.copyWith(color: AppColors.white),
    ),
    /*switchTheme: SwitchThemeData(
      thumbColor: AppColors.accentDark
    ),*/
    /*iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color?>(AppColors.primary),
          iconColor: MaterialStateProperty.all<Color?>(AppColors.primary),
        ),
      )*/
  );
}

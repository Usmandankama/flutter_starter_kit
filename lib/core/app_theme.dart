import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppFonts.primaryFont,
    textTheme: TextTheme(
      headlineLarge: AppFonts.headline.copyWith(color: AppColors.text),
      bodyLarge: AppFonts.body.copyWith(color: AppColors.text),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accentColor,
      error: AppColors.error,
      brightness: Brightness.dark,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.accentColor, // optional: reverse primary/accentColor
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: AppFonts.primaryFont,
    textTheme: TextTheme(
      headlineLarge: AppFonts.headline.copyWith(color: Colors.white),
      bodyLarge: AppFonts.body.copyWith(color: Colors.white70),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkAppBar,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(secondary: AppColors.accentColor, error: AppColors.error),
  );
}

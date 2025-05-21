import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFonts {
  static const String primaryFont = 'Poppins'; // replace with your font name

  static TextStyle headline = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static TextStyle body = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    color: AppColors.text,
  );

  static TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    color: AppColors.darkGray,
  );
}

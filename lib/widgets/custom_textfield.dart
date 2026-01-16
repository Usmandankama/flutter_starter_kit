import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/core/app_colors.dart';



class CustomTextfield extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.obscureText = false, MaterialColor? borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: AppColors.fontLight,
      ),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.fontDark),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.fontLight,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
      ),
    );
  }
}
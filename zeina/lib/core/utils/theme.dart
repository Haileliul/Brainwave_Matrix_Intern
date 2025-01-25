import 'package:flutter/material.dart';
import '../constants/colors.dart';

final ThemeData lightTheme = ThemeData(
  // Color Scheme
  scaffoldBackgroundColor: AppColors.background,
  cardColor: AppColors.background,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.red,
    brightness: Brightness.light,
  ),
);

import 'package:flutter/material.dart';
import 'colors.dart'; // Import the file where AppColors is defined

final ThemeData lightTheme = ThemeData(
  // Core Colors
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  cardColor: AppColors.cardBackground,
  dividerColor: AppColors.divider,

  // Typography
  /*  textTheme: TextTheme(

    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    bodyText1: TextStyle(fontSize: 16, color: AppColors.textSecondary),
    bodyText2: TextStyle(fontSize: 14, color: AppColors.textSecondary),
    button: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  ),
 */

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.divider),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.divider),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.error),
    ),
    hintStyle: TextStyle(color: AppColors.textSecondary),
    labelStyle: TextStyle(color: AppColors.textPrimary),
  ),

  // Icon Theme
  iconTheme: IconThemeData(
    color: AppColors.textPrimary,
  ),

  // Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.cardBackground,
    labelStyle: TextStyle(color: AppColors.textPrimary),
    secondaryLabelStyle: TextStyle(color: AppColors.textSecondary),
    brightness: Brightness.light,
    disabledColor: AppColors.divider,
    selectedColor: AppColors.primary,
    secondarySelectedColor: AppColors.accent,
    padding: EdgeInsets.all(8),
  ),

  // Color Scheme
  colorScheme: ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    surface: AppColors.cardBackground,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: AppColors.textPrimary,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
);

final ThemeData darkTheme = ThemeData(
  // Core Colors
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  cardColor: AppColors.darkCardBackground,
  dividerColor: AppColors.divider,

  // Typography
  /*  textTheme: TextTheme(

    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    bodyText1: TextStyle(fontSize: 16, color: AppColors.textSecondary),
    bodyText2: TextStyle(fontSize: 14, color: AppColors.textSecondary),
    button: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  ),
 */

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkCardBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.divider),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.divider),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.error),
    ),
    hintStyle: TextStyle(color: AppColors.darkTextSecondary),
    labelStyle: TextStyle(color: AppColors.darkTextPrimary),
  ),

  // Icon Theme
  iconTheme: IconThemeData(
    color: AppColors.darkTextPrimary,
  ),

  // Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.darkCardBackground,
    labelStyle: TextStyle(color: AppColors.darkTextPrimary),
    secondaryLabelStyle: TextStyle(color: AppColors.darkTextSecondary),
    brightness: Brightness.dark,
    disabledColor: AppColors.divider,
    selectedColor: AppColors.primary,
    secondarySelectedColor: AppColors.accent,
    padding: EdgeInsets.all(8),
  ),

  // Color Scheme
  colorScheme: ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    surface: AppColors.darkCardBackground,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: AppColors.darkTextPrimary,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
);

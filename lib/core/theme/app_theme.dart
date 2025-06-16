import 'package:flutter/material.dart';

import 'app_colors.dart'; // Assuming it's in a separate file

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightSurface,
    dividerColor: AppColors.lightDivider,

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightAccent,
      foregroundColor: Colors.white,
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightAccent,
      background: AppColors.lightBackground,
      surface: AppColors.lightSurface,
      error: AppColors.lightError,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.lightTextPrimary,
      onSurface: AppColors.lightTextPrimary,
      onError: Colors.white,
    ),
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    canvasColor: AppColors.darkSurface,
    cardColor: AppColors.darkElevatedSurface,
    dividerColor: AppColors.darkDivider,

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkAccent,
      foregroundColor: AppColors.darkBackground,
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkAccent,
      background: AppColors.darkBackground,
      surface: AppColors.darkSurface,
      error: AppColors.darkError,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.darkTextPrimary,
      onSurface: AppColors.darkTextPrimary,
      onError: Colors.black,
    ),
  );
}

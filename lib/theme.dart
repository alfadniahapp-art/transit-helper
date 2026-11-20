import 'package:flutter/material.dart';

class AppColors {
  static const Color navy = Color(0xFF0B1E3A);
  static const Color navy2 = Color(0xFF122A4E);
  static const Color gold = Color(0xFFD4AF37);
  static const Color gold2 = Color(0xFFF2D06B);
  static const Color white = Colors.white;
  static const Color bg = Color(0xFFF4F7FC);
}

ThemeData buildAppTheme() {
  return ThemeData(
    primaryColor: AppColors.navy,
    scaffoldBackgroundColor: AppColors.bg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.navy,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 4,
      shadowColor: AppColors.navy.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

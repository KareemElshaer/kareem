import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      showUnselectedLabels: false,
    ),
    fontFamily: "JannaLT",
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backg,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
  );
}

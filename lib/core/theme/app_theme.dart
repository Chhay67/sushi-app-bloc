import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData themeData = ThemeData(
   fontFamily: GoogleFonts.notoSans().fontFamily,
   useMaterial3: false,
   brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.btnColor,
      ),
      backgroundColor: AppColors.background,
    ),
  );
}
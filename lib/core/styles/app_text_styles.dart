import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle logoStyle = GoogleFonts.aBeeZee(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static TextStyle aBee24Black = GoogleFonts.aBeeZee(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static TextStyle work18Pink = GoogleFonts.workSans(
    color: AppColors.pink,
    fontSize: 18,
    letterSpacing: 1.2,
  );
}

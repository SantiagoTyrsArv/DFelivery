import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFEF2A39);
  static const Color splashGradientStart = Color(0xFFFF939B);
  static const Color splashGradientEnd = Color(0xFFEF2A39);
  static const Color profileGradientStart = Color(0xFFFF2A9D);
  static const Color profileGradientEnd = Color(0xFFEF2A39);
  static const Color darkBrown = Color(0xFF3C2F2F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6A6E83);
  static const Color searchBarBg = Color(0xFFF5F5F5);
  static const Color chipUnselected = Color(0xFFF5F5F5);
  static const Color chatBubbleSupport = Color(0xFFF0F0F0);
  static const Color inputFieldBg = Color(0xFFF5F5F8);
  static const Color inputFieldBorder = Color(0xFFE0E0E0);
  static const Color ratingStar = Color(0xFFEF2A39);
  static const Color heartGrey = Color(0xFF6A6E83);
  static const Color green = Color(0xFF4CAF50);
  static const Color creditCardDark = Color(0xFF3C2F2F);
}

class AppTextStyles {
  static TextStyle get logoSplash => GoogleFonts.lobster(
        fontSize: 48,
        color: AppColors.white,
      );

  static TextStyle get logoHome => GoogleFonts.lobster(
        fontSize: 32,
        color: AppColors.textPrimary,
      );

  static TextStyle get subtitle => GoogleFonts.poppins(
        fontSize: 16,
        color: AppColors.textSecondary,
      );

  static TextStyle get productName => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get productSubtitle => GoogleFonts.poppins(
        fontSize: 12,
        color: AppColors.textSecondary,
      );

  static TextStyle get rating => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  static TextStyle get priceTag => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  static TextStyle get priceLarge => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyText => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textSecondary,
      );

  static TextStyle get buttonText => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  static TextStyle get sectionTitle => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get detailTitle => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get chipSelected => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );

  static TextStyle get chipUnselected => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );

  static TextStyle get searchHint => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textSecondary,
      );

  static TextStyle get chatText => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textPrimary,
      );

  static TextStyle get chatTextWhite => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.white,
      );

  static TextStyle get labelSmall => GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );

  static TextStyle get fieldLabel => GoogleFonts.poppins(
        fontSize: 12,
        color: AppColors.textSecondary,
      );

  static TextStyle get fieldValue => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textPrimary,
      );
}

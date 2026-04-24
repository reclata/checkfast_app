import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Poppins';

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.darkBlue,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 18,
    color: AppColors.neutralGray,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.normal, // Regular
    fontSize: 14,
    color: AppColors.darkBlue,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 16,
    color: AppColors.white,
  );
}

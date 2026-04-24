import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF146EF5);
  static const Color darkBlue = Color(0xFF0D1B2A);
  static const Color cyan = Color(0xFF00B8FF);
  static const Color successGreen = Color(0xFF22C55E);
  static const Color neutralGray = Color(0xFF6B7280);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF9FAFB);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, cyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

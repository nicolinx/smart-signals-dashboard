import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0F1115);
  static const Color cardBg = Color(0xFF1A1D23);

  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentGreen = Color(0xFF34d399);
  static const Color accentRed = Color(0xFFEF4444);

  static const Color textGrey = Color(0xFF94a3b8);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      useMaterial3: true,

      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),

      cardTheme: .new(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
    );
  }

  static BoxDecoration glassBox({Color? glowColor, bool isActive = false}) {
    return BoxDecoration(
      color: isActive
          ? (glowColor ?? accentBlue).withValues(alpha: 0.1)
          : cardBg,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: isActive
            ? (glowColor ?? accentBlue).withValues(alpha: 0.5)
            : Colors.white.withValues(alpha: 0.05),
        width: 1.5,
      ),
      boxShadow: [
        if (isActive)
          BoxShadow(
            color: (glowColor ?? accentBlue).withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 2,
          ),
      ],
    );
  }
}

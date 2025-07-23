import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'Mulish';
static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 57,
    height: 64 / 57, // lineHeight / fontSize
    letterSpacing: -0.25,
  );
  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 45,
    height: 52 / 45,
    letterSpacing: 0,
  );
  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: 0,
  );

  // Headline styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 0,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: 0,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: 0,
  );

  // Title styles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
  );
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.w500, // Medium (SemiBold equivalent)
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
  );
  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.w500, // Medium
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.normal,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.w500, // Medium
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  );
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.w500, // Medium
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
  );
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily, // Use the public fontFamily
    fontWeight: FontWeight.w500, // Medium
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.5,
  );
}

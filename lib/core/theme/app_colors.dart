import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryLight = Color(
    0xFF1976D2,
  ); // A standard Material blue
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color primaryContainerLight = Color(
    0xFFBBDEFB,
  ); // Lighter blue for containers
  static const Color onPrimaryContainerLight = Color(
    0xFF0D47A1,
  ); // Darker blue for text on container

  static const Color secondaryLight = Color(
    0xFFD32F2F,
  ); // A strong red (previously primary)
  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color secondaryContainerLight = Color(
    0xFFFFCDD2,
  ); // Lighter red for secondary containers
  static const Color onSecondaryContainerLight = Color(
    0xFFB71C1C,
  ); // Darker red for text on secondary container

  static const Color tertiaryLight = Color(
    0xFF65597B,
  ); // Keeping original tertiary for now, can be adjusted
  static const Color onTertiaryLight = Color(0xFFFFFFFF);
  static const Color tertiaryContainerLight = Color(0xFFEADDFF);
  static const Color onTertiaryContainerLight = Color(0xFF201734);

  static const Color errorLight = Color(0xFFBA1A1A);
  static const Color onErrorLight = Color(0xFFFFFFFF);
  static const Color errorContainerLight = Color(0xFFFFDAD6);
  static const Color onErrorContainerLight = Color(0xFF410002);

  // --- MODIFIED COLORS FOR YOUR REQUIREMENTS ---
  static const Color backgroundLight = Color(
    0xFFF6F6F6,
  ); // Slightly darker off-white for the overall screen background
  static const Color onBackgroundLight = Color(
    0xFF191C1E,
  ); // Dark text on background
  static const Color surfaceLight = Color(
    0xFFFFFFFF,
  ); // Pure white for the Card background
  static const Color onSurfaceLight = Color(0xFF191C1E); // Dark text on surface
  // --- END MODIFIED COLORS ---

  static const Color surfaceVariantLight = Color(
    0xFFDDE3EA,
  ); // Light grey for surface variants
  static const Color onSurfaceVariantLight = Color(
    0xFF42474E,
  ); // Darker text on surface variants
  static const Color outlineLight = Color(0xFF72787E);
  static const Color scrimLight = Color(0xFF000000);
  static const Color inverseSurfaceLight = Color(0xFF2E3133);
  static const Color inverseOnSurfaceLight = Color(
    0xFFF0F1F3,
  ); // <--- Defined here
  static const Color inversePrimaryLight = Color(
    0xFFEF9A9A,
  ); // Lighter red for inverse primary
  static const Color surfaceDimLight = Color(0xFFD8DAE0);
  static const Color surfaceBrightLight = Color(0xFFFBFCFE);
  static const Color surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowLight = Color(0xFFF2F5FA);
  static const Color surfaceContainerLight = Color(0xFFEDEFF4);
  static const Color surfaceContainerHighLight = Color(
    0xFFE0E0E0,
  ); // Adjusted slightly to distinguish from pure white surface
  static const Color surfaceContainerHighestLight = Color(0xFFD1D3D8);

  // Dark Theme Colors
  static const Color primaryDark = Color(
    0xFF1976D2,
  ); // A lighter blue for dark theme visibility
  static const Color onPrimaryDark = Color(
    0xFF0D47A1,
  ); // Darker blue for text on primary
  static const Color primaryContainerDark = Color(
    0xFF1565C0,
  ); // Darker blue for containers
  static const Color onPrimaryContainerDark = Color(
    0xFFBBDEFB,
  ); // Lighter blue for text on container

  static const Color secondaryDark = Color(
    0xFFD32F2F,
  ); // A slightly lighter red for dark theme visibility
  static const Color onSecondaryDark = Color(
    0xFFB71C1C,
  ); // Dark red for text on secondary
  static const Color secondaryContainerDark = Color(
    0xFFC62828,
  ); // Darker red for secondary containers
  static const Color onSecondaryContainerDark = Color(
    0xFFFFCDD2,
  ); // Lighter red for text on secondary container

  static const Color tertiaryDark = Color(
    0xFFCFBCF8,
  ); // Keeping original tertiary for now, can be adjusted
  static const Color onTertiaryDark = Color(0xFF352C4A);
  static const Color tertiaryContainerDark = Color(0xFF4D4262);
  static const Color onTertiaryContainerDark = Color(0xFFEADDFF);

  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color onErrorDark = Color(0xFF690005);
  static const Color errorContainerDark = Color(0xFF93000A);
  static const Color onErrorContainerDark = Color(0xFFFFDAD6);

  static const Color backgroundDark = Color.fromARGB(
    255,
    0,
    0,
    0,
  ); // Slightly darker than pure black for overall background
  static const Color onBackgroundDark = Color(
    0xFFE0E0E0,
  ); // Light grey text on dark background
  static const Color surfaceDark = Color(
    0xFF1C1C1C,
  ); // A slightly less dark "white card" equivalent for dark mode
  static const Color onSurfaceDark = Color(
    0xFFE0E0E0,
  ); // Light grey text on dark surface

  static const Color surfaceVariantDark = Color(
    0xFF212121,
  ); // Very dark grey for surface variants
  static const Color onSurfaceVariantDark = Color(
    0xFFB0BEC5,
  ); // Lighter text on surface variants
  static const Color outlineDark = Color(0xFF616161);
  static const Color scrimDark = Color(0xFF000000);
  static const Color inverseSurfaceDark = Color(0xFFE0E0E0);
  static const Color inverseOnSurfaceDark = Color(0xFF212121);
  static const Color inversePrimaryDark = Color(
    0xFFD32F2F,
  ); // Red for inverse primary in dark mode
  static const Color surfaceDimDark = Color(0xFF000000);
  static const Color surfaceBrightDark = Color(0xFF212121);
  static const Color surfaceContainerLowestDark = Color(0xFF000000);
  static const Color surfaceContainerLowDark = Color(0xFF0A0A0A);
  static const Color surfaceContainerDark = Color(0xFF121212);
  static const Color surfaceContainerHighDark = Color(0xFF1A1A1A);
  static const Color surfaceContainerHighestDark = Color(0xFF212121);

  static const Color healthCardRed = Color(0xFFEF5350);
  static const Color termPlanCardBlue = Color(0xFF42A5F5);
  static const Color ulipCardBrown = Color(0xFF8D6E63);
  static const Color savingsCardGreen = Color(0xFF66BB6A);
  static const Color childPlansCardPink = Color(0xFFEC407A);
  static const Color ridersCardGrey = Color(0xFFBDBDBD);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parima/themes/colors.dart';

final baseLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: lightSurfaceColor,
    surfaceBright: lightSurfaceBrightColor,
    onSurface: Colors.black,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: lightBackgroundColor,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: lightSurfaceColor,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final lightTheme = baseLightTheme.copyWith(
  textTheme: GoogleFonts.sarabunTextTheme(baseLightTheme.textTheme),
);

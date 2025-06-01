import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parima/themes/colors.dart';

final baseDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    surface: surfaceColor,
    surfaceBright: brightSufaceColor,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: darkBackgroundColor,
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto Mono',
    ),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: surfaceColor,
  ),
);

final darkTheme = baseDarkTheme.copyWith(
  textTheme: GoogleFonts.sarabunTextTheme(baseDarkTheme.textTheme),
);

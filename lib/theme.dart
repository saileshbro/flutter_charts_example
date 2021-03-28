import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData _lightThemeData = ThemeData.light();

final ThemeData kLightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  popupMenuTheme: PopupMenuThemeData(
    textStyle: _lightThemeData.textTheme.subtitle1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textTheme: GoogleFonts.workSansTextTheme().copyWith(
    headline1: _lightThemeData.textTheme.headline1.copyWith(
      fontSize: 96,
      fontWeight: FontWeight.w300,
    ),
    headline2: _lightThemeData.textTheme.headline2.copyWith(
      fontSize: 60,
      fontWeight: FontWeight.w600,
    ),
    headline3: _lightThemeData.textTheme.headline3.copyWith(
      fontSize: 20,
      color: const Color(0xFF252525),
      fontWeight: FontWeight.w500,
    ),
    subtitle1: _lightThemeData.textTheme.subtitle1.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    headline4: _lightThemeData.textTheme.headline4.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1b1b1b),
    ),
    bodyText1: _lightThemeData.textTheme.bodyText1.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF1b1b1b),
    ),
    bodyText2: _lightThemeData.textTheme.bodyText2.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF1b1b1b),
    ),
    button: _lightThemeData.textTheme.button.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF252525),
    ),
    caption: _lightThemeData.textTheme.caption.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF4A6572),
    ),
  ),
);

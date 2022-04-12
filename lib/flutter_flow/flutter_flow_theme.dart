// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;

  TextStyle get title1 => TextStyle(
        fontFamily: 'Aeonik',
        color: primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 64,
      );
  TextStyle get title2 => TextStyle(
        fontFamily: 'Aeonik',
        color: secondaryText,
        fontWeight: FontWeight.w800,
        fontSize: 56,
      );
  TextStyle get title3 => TextStyle(
        fontFamily: 'Aeonik',
        color: primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 48,
      );
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'Aeonik',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'Aeonik',
        color: secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      );
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'Aeonik',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Aeonik',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF23C562);
  Color secondaryColor = const Color(0xFFFF1843);
  Color tertiaryColor = const Color(0xFFFFB800);
  Color alternate = const Color(0xFF1867FF);
  Color primaryBackground = const Color(0xFFFFFFFF);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF17181A);
  Color secondaryText = const Color(0xFF57636C);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFF878C90);
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF23C562);
  Color secondaryColor = const Color(0xFFFF1843);
  Color tertiaryColor = const Color(0xFFFFB800);
  Color alternate = const Color(0xFF1867FF);
  Color primaryBackground = const Color(0xFF212121);
  Color secondaryBackground = const Color(0xFF212121);
  Color primaryText = const Color(0xFFFFFFFF);
  Color secondaryText = const Color(0xFFFFFFFF);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFF333333);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}

// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color safeLight;
  late Color safeDark;
  late Color buttonBackground;
  late Color buttonText;
  late Color customBlueGreen;
  late Color gradient1;
  late Color gradient2;
  late Color temperatureBg;
  late Color temperatureText;
  late Color speedBg;
  late Color speedText;
  late Color weightBg;
  late Color weightText;
  late Color sizeBg;
  late Color sizeText;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF3730A3);
  late Color secondaryColor = const Color(0xFFE0E7FF);
  late Color tertiaryColor = const Color(0xFF5E69EE);
  late Color alternate = const Color(0xFFB8E6E0);
  late Color primaryBackground = const Color(0xFFEFEFEF);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xE8000000);
  late Color secondaryText = const Color(0xFF57636C);

  late Color safeLight = Color(0xFFD0EBDA);
  late Color safeDark = Color(0xFF166534);
  late Color buttonBackground = Color(0xFF4E46E5);
  late Color buttonText = Color(0xFFFFFFFF);
  late Color customBlueGreen = Color(0xFF005B78);
  late Color gradient1 = Color(0xFFADC0FF);
  late Color gradient2 = Color(0xFFA8AEFF);
  late Color temperatureBg = Color(0xFFFEE2E2);
  late Color temperatureText = Color(0xFF991B1B);
  late Color speedBg = Color(0xFFE0E7FF);
  late Color speedText = Color(0xFF3730A3);
  late Color weightBg = Color(0xFFDCFCE7);
  late Color weightText = Color(0xFF166534);
  late Color sizeBg = Color(0xFFFEF9C3);
  late Color sizeText = Color(0xFF854D0E);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lexend Deca';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title2Family => 'Lexend Deca';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: theme.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 28,
      );
  String get title3Family => 'Lexend Deca';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  String get subtitle1Family => 'Lexend Deca';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Color(0xFF8B97A2),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Lexend Deca';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Color(0xFF8B97A2),
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Lexend Deca';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Color(0xFF8B97A2),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Lexend Deca';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}

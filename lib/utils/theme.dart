import 'package:flutter/material.dart';
import 'package:max_bit/utils/colors.dart';
import 'package:max_bit/utils/constants.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryLight,
    accentColor: darkAccent,
    cursorColor: darkAccent,
    fontFamily: AvailableFonts.primaryFont,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

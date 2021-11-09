import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/color_palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.kBlack,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: ColorPalette.kRed,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      headline2: TextStyle(
        color: ColorPalette.kWhite,
      ),
      headline3: TextStyle(
        color: ColorPalette.kWhite,
      ),
      headline6: TextStyle(
        color: ColorPalette.kGrey,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: ColorPalette.kGrey,
      ),
    ),
  );
}

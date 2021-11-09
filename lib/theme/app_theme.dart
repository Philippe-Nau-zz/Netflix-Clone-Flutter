import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/color_palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.kBlack,
    textTheme: TextTheme(
      headline3: TextStyle(
        color: ColorPalette.kWhite,
      ),
    ),
  );
}

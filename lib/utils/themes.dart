import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//new theming
const COLOR_BLACK = Colors.black;
const BLUE_GREY = Color(0xffECEFF1);
const BLUE_GREY_300 = Color(0xff90A4AE);
const CYAN_500 = Color(0xff26C6DA);
const BASE_BLUE = Color(0xff2e303c);
const GREY_BASE = Color(0xffDFD9D4);
const GREY_BASE_LIGHT = Color(0xfff4eeea);
const LIGHT_YELLOW_GREY = Color(0xffefe9e4);
const WHITE30 = Colors.white30;
const GREY = Colors.grey;
const BASE_BLUE5 = Color(0xff53545D);
const BASE_BLUE6 = Color(0xff41424C);
const GREY_BASE2 = Color(0xffCDC7C4);


class AppDefaultTheme {
  static ThemeData themeData = _buildDefaultAmplifyTheme();

  static ThemeData _buildDefaultAmplifyTheme() {
    final defaultTextTheme = ThemeData.light().textTheme;

    return ThemeData.light().copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(
        defaultTextTheme,
      ),
      primaryColor: BASE_BLUE,
      accentColor: CYAN_500,
    );
  }
}

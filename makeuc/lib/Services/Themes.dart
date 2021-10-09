import 'package:flutter/material.dart';

class MyThemes {
  int darkcolor = 0xFF2F1E3F;

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFFEBDB51),
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: Color(0xFF2F1E3F)),
      shadowColor: Color(0xFF593978));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF2F1E3F),
      colorScheme: ColorScheme.dark(),
      iconTheme: IconThemeData(
        color: Color(0xFFEBDB51),
      ),
      shadowColor: Color(0xFFCF9B3A));
}

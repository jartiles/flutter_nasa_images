import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData customTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 5,
        primary: const Color(0xffff0e9d),
      ),
    ),
  );
}

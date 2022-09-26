import 'package:flutter/material.dart';

class CustomTheme {
  final apodContainerGradient = LinearGradient(
    colors: [
      const Color(0xff003e75).withOpacity(0.3),
      const Color(0xff00244f).withOpacity(0.7),
      const Color(0xff01112d).withOpacity(0.9),
    ],
    begin: const Alignment(1, -1),
  );
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

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF6750A4);
  static const Color primaryPurpleLight = Color.fromARGB(255, 204, 189, 244);

  static const Color lightBackgroundColor = Color.fromARGB(255, 253, 253, 253);
  static const Color darkBackgroundColor = Color.fromARGB(255, 46, 46, 46);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple, brightness: Brightness.light),
    scaffoldBackgroundColor: lightBackgroundColor,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryPurpleLight, brightness: Brightness.dark),
    scaffoldBackgroundColor: darkBackgroundColor,
  );
}

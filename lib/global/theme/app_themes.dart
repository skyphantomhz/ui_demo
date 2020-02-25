import 'package:flutter/material.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

final appThemeData = {
  "Green Light": ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      colorScheme: ColorScheme.light()),
  "Green Dark": ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green[700],
      colorScheme: ColorScheme.dark()),
  "Blue Dart": ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue[700],
      colorScheme: ColorScheme.dark()),
  "Blue Light": ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.light()),
};

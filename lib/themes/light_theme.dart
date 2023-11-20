import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey[300] as Color,
      primary: Colors.white,
      secondary: Colors.grey[400] as Color,
    ));

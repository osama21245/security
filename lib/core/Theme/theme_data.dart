import 'package:flutter/material.dart';
import 'package:security/core/Theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) =>
      OutlineInputBorder(borderSide: BorderSide(width: 3, color: color));
  static final appDarkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color.fromARGB(255, 0, 15, 24),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(AppPallete.gradient2),
        errorBorder: _border(AppPallete.errorColor),
      ),
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromARGB(255, 0, 15, 24)));
}

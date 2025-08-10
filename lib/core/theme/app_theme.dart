import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

class AppTheme {
  static _border([Color color = AppColors.darkBlue, double width = 3]) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
        borderRadius: BorderRadius.circular(10),
      );
  static final whiteThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.whiteColor,

    appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteColor),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      focusedBorder: _border(),
      enabledBorder: _border(AppColors.darkBlue, 2),
    ),
  );
}

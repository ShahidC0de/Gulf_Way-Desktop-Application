import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_theme.dart';
import 'package:gulf_way/features/home/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.whiteThemeMode,
      home: HomePage(),
    );
  }
}

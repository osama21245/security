import 'package:flutter/material.dart';
import 'package:security/core/Theme/theme_data.dart';
import 'package:security/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.appDarkTheme,
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_challenge/task_1/onboarding_screen.dart';
import 'package:mobile_challenge/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
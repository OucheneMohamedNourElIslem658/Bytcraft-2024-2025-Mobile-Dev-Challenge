import 'package:flutter/material.dart';
import 'package:mobile_challenge/constents/colors.dart';
import 'package:mobile_challenge/constents/text_styles.dart';

abstract class CustomTheme {
  static var lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent
    ),
    primaryColor: CustomColors.blue1,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.blue1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 0,
        textStyle: TextStyles.style3,
        foregroundColor: Colors.white
      )
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: CustomColors.grey2,
        padding: const EdgeInsets.all(0),
        iconSize: 15,
        alignment: Alignment.center,
        shape: const CircleBorder()
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyles.style2,
        foregroundColor: CustomColors.blue1,
        padding: const EdgeInsets.symmetric(
          horizontal: 5
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      )
    )
  );
}
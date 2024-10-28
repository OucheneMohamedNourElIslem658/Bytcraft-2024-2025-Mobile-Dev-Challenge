import 'package:flutter/material.dart';
import 'package:mobile_challenge/constents/colors.dart';

abstract class TextStyles {
  static const style1 = TextStyle(
    fontSize: 30,
    color: CustomColors.black1,
    fontFamily: Fonts.geometr
  );

  static const style2 = TextStyle(
    fontSize: 16,
    color: CustomColors.grey1,
    fontFamily: Fonts.gill
  );

  static const style3 = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: Fonts.sfSemibold
  );

  static const style4 = TextStyle(
    fontSize: 26,
    color: CustomColors.black1,
    fontFamily: Fonts.sfSemibold
  );

  static const style5 = TextStyle(
    fontSize: 14,
    color: CustomColors.grey1,
    fontFamily: Fonts.gill
  );

  static const style6 = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: Fonts.sfSemibold
  );

  static const style7 = TextStyle(
    fontSize: 13,
    color: Colors.white,
    fontFamily: Fonts.sfReg
  );

  static const style8 = TextStyle(
    fontSize: 11,
    color: CustomColors.black1,
    fontFamily: Fonts.sfReg,
    fontWeight: FontWeight.bold
  );

  static const style9 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: Fonts.sfSemibold
  );

  static const style10 = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: Fonts.sfReg,
    fontWeight: FontWeight.bold
  );
}

abstract class Fonts {
  static const geometr = "geometr";
  static const gill = "gill";
  static const sfSemibold = "sf-semibold";
  static const sfReg = "sf-reg";
}
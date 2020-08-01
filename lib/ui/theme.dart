import 'package:NitipBeli/utils/constant.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'OpenSans',
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
    ),
    primaryColor: kColorPrimary,
    accentColor: kColorPrimary,
    hintColor: Color(0xffcdd3e0),
    dividerColor: Colors.grey[100],
    buttonColor: kColorPrimary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: Colors.grey[600],
      ),
      caption: TextStyle(
        fontSize: 12,
      ),
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      button: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[100],
      thickness: 1,
    ),
  );
}

import 'package:flutter/material.dart';

ThemeData customTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Colors.black, fontSize: 13.5, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.black, fontSize: 13.5, fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.normal),
  );
}

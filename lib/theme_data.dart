import 'package:flutter/material.dart';

ThemeData isLight() => ThemeData(
  fontFamily: 'Georgia',
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
  ).copyWith(secondary: Colors.lightBlue),

  textTheme: const TextTheme(
      headline1: TextStyle(fontFamily: 'LetteraTrentadue', fontSize: 32, color: Colors.black),
      bodyText1: TextStyle(fontFamily:'BureauAP', fontSize: 26, color: Colors.brown),
      bodyText2: TextStyle(fontFamily: 'Plainot', fontSize: 22, color: Colors.black)
  ),

);

ThemeData isDark() => ThemeData(
  fontFamily: 'Georgia',
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
  ).copyWith(
    secondary: Colors.green,
  ),
  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 32, fontFamily:'LetteraTrentadue', color: Colors.white),
      bodyText1: TextStyle(fontFamily: 'BureauAP', fontSize: 26,color: Colors.yellowAccent),
      bodyText2: TextStyle(fontFamily: 'Plainot', fontSize: 22, color: Colors.white)
  ),

);
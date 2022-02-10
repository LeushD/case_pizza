import 'package:flutter/material.dart';

ThemeData globalTheme1() => ThemeData(
  fontFamily: 'Georgia',
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,).copyWith(secondary: Colors.lightBlue),

  textTheme: const TextTheme(
      headline1: TextStyle(fontFamily: 'LetteraTrentadue', fontSize: 32, color: Colors.black),
      bodyText1: TextStyle(fontFamily:'BureauAP', fontSize: 26, color: Colors.brown),
      bodyText2: TextStyle(fontFamily: 'Plainot', fontSize: 22, color: Colors.black)
  ),
);

ThemeData globalTheme2() => ThemeData(
  fontFamily: 'Georgia',

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ),

  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 32, fontFamily:'LetteraTrentadue', color: Colors.white),
      bodyText1: TextStyle(fontFamily: 'BureauAP', fontSize: 26,color: Colors.white30),
      bodyText2: TextStyle(fontFamily: 'Plainot', fontSize: 22, color: Colors.white)
  ),

);
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: bgColor, foregroundColor: Colors.white),
    useMaterial3: true,
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(textStyle: TextStyle())),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          foregroundColor: primaryColor),
    ),
    canvasColor: Colors.white,
    primarySwatch: myPrimarySwatch,
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    primaryColorDark: Colors.black,
    inputDecorationTheme: const InputDecorationTheme(fillColor: primaryColor));

const bgColor = Color(0xFF000000);
const primaryColor = Color(0xFFFFFFFF);
const secondaryColor = Color.fromRGBO(167, 12, 12, 1);
const lightGreyColor = Color.fromRGBO(212, 212, 212, 1);
const darkGreyColor = Color.fromARGB(255, 35, 35, 35);

//! gradient colors
const pink = Color(0xFFFF00AE);
const orange = Color(0xFFFA8507);
const green = Color(0xFF00FF51);
const blue = Color(0xFF057AF8);
const red = Color(0xFFD55650);
const yellow = Color(0xFFE8AD4F);

const MaterialColor myPrimarySwatch = MaterialColor(0xFFD55650, {
  50: Color(0xffffe9ec),
  100: Color(0xffffc9cd),
  200: Color(0xfff59390),
  300: Color(0xffec6865),
  400: Color(0xfff5413d),
  500: Color(0xfff9291b),
  600: Color(0xFFD55650),
  700: Color(0xffd90217),
  800: Color(0xffcc000f),
  900: Color(0xffbe0000)
});

LinearGradient linearGradientColor = const LinearGradient(
  begin: Alignment(-0.972, 0.0),
  end: Alignment(0.974, 0.0),
  colors: [
    Color(0xFFFA8507),
    Color(0xFFE8AD4F),
  ],
  stops: [0.0, 0.994],
);

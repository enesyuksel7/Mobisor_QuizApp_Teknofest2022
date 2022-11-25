import 'package:flutter/material.dart';
import 'sub_theme_data_mixin.dart';

const Color kPrimayColorDT = Color.fromARGB(255, 17, 160, 118);
const Color kPrimayLightColorDT = Color.fromARGB(255, 0, 0, 0);
const Color appBarIconColorDT = Colors.black;
const Color mainTextColorDT = Colors.white;
const Color iconColorDT = Colors.black;
const Color shadowColorDT = Color.fromARGB(90, 172, 172, 172);
const Color cardColorDT = Color.fromARGB(255, 77, 154, 67);
const Color scaffoldBackgroundColor = Color.fromARGB(255, 20, 20, 40);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
       visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        splashColor: kPrimayColorDT.withOpacity(0.1),
        highlightColor: kPrimayColorDT.withOpacity(0.05),
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorDT,
          displayColor: mainTextColorDT
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: getElavatedButtonTheme()),
        cardColor: cardColorDT,
        primaryColor: kPrimayColorDT);
  }
}

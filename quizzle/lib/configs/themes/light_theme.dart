import 'package:flutter/material.dart';
import 'sub_theme_data_mixin.dart';

const Color kPrimayLightColorLT = Color.fromARGB(255, 17, 115, 160);
const Color kPrimayColorLT = Color.fromARGB(255, 16, 30, 142);
const Color appBarIconColorLT = Colors.white;
const Color mainTextColorLT = Color.fromARGB(255, 255, 255, 255);
const Color iconColorLT = Colors.yellowAccent;
const Color shadowColorLT = Color.fromARGB(90, 172, 172, 172);
const Color cardColorLT = Color.fromARGB(255, 45, 92, 193);
const Color scaffoldBackgroundColorLT = Color.fromARGB(255, 17, 115, 160);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: scaffoldBackgroundColorLT,
        iconTheme: getIconTheme(),
        splashColor: kPrimayColorLT.withOpacity(0.1),
        highlightColor: kPrimayColorLT.withOpacity(0.05),
        splashFactory: InkRipple.splashFactory,
        textTheme: getTextThemes().apply(bodyColor: mainTextColorLT, displayColor: mainTextColorLT),
        primaryColor: kPrimayColorLT,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: getElavatedButtonTheme()),
        cardColor: cardColorLT,
        colorScheme: ColorScheme.fromSwatch(
            accentColor: kPrimayColorLT, primarySwatch: Colors.purple));
  }
}

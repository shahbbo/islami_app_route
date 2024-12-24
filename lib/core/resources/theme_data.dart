
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/color_data.dart';

class MyThemeData  {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(backgroundColor:ColorData.black),
  );
}

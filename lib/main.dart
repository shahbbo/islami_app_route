import 'package:flutter/material.dart';
import 'package:islami_app/featres/splash/splash_screen.dart';
import 'package:islami_app/core/resources/theme_data.dart';

import 'featres/Hadeth/presentation/pages/hadeth_details_screen.dart';
import 'featres/Quran/presentation/pages/sura_details_screen.dart';
import 'featres/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName :(context)=> const SplashScreen(),
        HomeScreen.routeName :(context)=> const HomeScreen(),
        SuraDetailsScreen.routeName :(context)=> const SuraDetailsScreen(),
        HadethDetailsScreen.routeName :(context)=> const HadethDetailsScreen(),
      },
    );
  }
}


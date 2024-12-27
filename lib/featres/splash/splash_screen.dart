import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/featres/on_boarding/OnBoarding.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, OnBoarding.routeName);
    });
    return Scaffold(
      backgroundColor: const Color(0xff29384D),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/SplashScreen.png"),
              fit: BoxFit.cover,)),
      ),
    );
  }
}

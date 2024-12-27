import 'dart:async';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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

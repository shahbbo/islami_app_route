import 'package:flutter/material.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/time_bg.png'),fit: BoxFit.cover)
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
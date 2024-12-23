import 'package:flutter/material.dart';
import 'package:islami_app/core/color_data.dart';

import '../../data/hadeth_modal.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadethDetailsScreen';

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)?.settings.arguments as HadethModal;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorData.gold),
        centerTitle: true,
        title: Text(
          hadeth.title,
          style: const TextStyle(
            color: ColorData.gold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 40),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/detailsScreen_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              hadeth.title,
              style: const TextStyle(
                  color: ColorData.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: hadeth.matn.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ColorData.gold,
                    ))
                  : ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          hadeth.matn.toString(),
                          style: const TextStyle(
                              color: ColorData.gold,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}

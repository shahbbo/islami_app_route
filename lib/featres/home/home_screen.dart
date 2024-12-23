import 'package:flutter/material.dart';
import 'package:islami_app/core/color_data.dart';
import 'package:islami_app/featres/Hadeth/presentation/pages/hadeth_screen.dart';

import '../Quran/presentation/pages/quran_screen.dart';
import '../Radio/radio_screen.dart';
import '../Sebha/presentation/pages/sebha_screen.dart';
import '../Time/time_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreen =0;
  Widget BottomNavTabBuilder({required int index,required String imagePath }){
      return selectedScreen == index
          ?Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorData.lightBlack),
        child: ImageIcon(
          AssetImage(imagePath),
        ),
      )
          : ImageIcon(
        AssetImage(imagePath),
      );
  }
  List<Widget> screens=[
    const QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const TimeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            selectedScreen = index;
            setState(() {});
          },
          currentIndex: selectedScreen,
          showUnselectedLabels: false,
          unselectedItemColor: ColorData.black,
          selectedItemColor: ColorData.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorData.gold,
          items: [
            BottomNavigationBarItem(
                label: "Quran",
                icon: BottomNavTabBuilder(index: 0, imagePath: 'assets/images/quran_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Hadeth",
                icon: BottomNavTabBuilder(index: 1, imagePath: 'assets/images/hadeth_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Sebha",
                icon: BottomNavTabBuilder(index: 2, imagePath: 'assets/images/sebha_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Radio",
                icon: BottomNavTabBuilder(index: 3, imagePath: 'assets/images/radio_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Time",
                icon: BottomNavTabBuilder(index: 4, imagePath: 'assets/images/time_icon.png')),
          ]),
    );
  }
}

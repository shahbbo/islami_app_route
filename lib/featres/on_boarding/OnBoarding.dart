import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/color_data.dart';

import '../home/home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  static const String routeName = "on_boarding";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<String> onBoardingImages = [
    "assets/images/onBoarding1.png",
    "assets/images/onBoarding2.png",
    "assets/images/onBoarding3.png",
    "assets/images/onBoarding4.png",
    "assets/images/onBoarding5.png",
  ];

  final List<String> onBoardingTitles = [
    "Welcome To Islmi App",
    "Welcome To Islami",
    "Reading the Quran",
    "Bearish",
    "Holy Quran Radio",
  ];

  final List<String> onBoardingSubTitles = [
    "",
    "We Are Very Excited To Have You In Our Community",
    "Read, and your Lord is the Most Generous",
    "Praise the name of your Lord, the Most High",
    "You can listen to the Holy Quran Radio through the application for free and easily",
  ];

  int currentIndex = 0;
  PageController pageController = PageController();
  bool isLast = false;

  void moveToPage(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xff202020),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Mosque-01.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset("assets/images/Islami.png"),
              ),
              SizedBox(
                height: 470,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      isLast = index == onBoardingImages.length - 1;
                    });
                  },
                  children: List.generate(
                    onBoardingImages.length,
                        (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            onBoardingImages[index],
                            width: 300,
                            height: 300,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            textAlign: TextAlign.center,
                            onBoardingTitles[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            textAlign: TextAlign.center,
                            onBoardingSubTitles[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (currentIndex > 0) {
                        moveToPage(currentIndex - 1);
                      }
                    },
                    child: Visibility(
                      visible: currentIndex > 0,
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          color: ColorData.gold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingImages.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: currentIndex == index ? 25 : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: currentIndex == index
                                    ? ColorData.gold
                                    : Colors.grey,
                              ),
                            ),
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex < onBoardingImages.length - 1) {
                        moveToPage(currentIndex + 1);
                      }else if (currentIndex == onBoardingImages.length - 1) {
                          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                      }
                    },
                    child: Text(
                      isLast ? "Finish" : "Next",
                      style: const TextStyle(
                        color: ColorData.gold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

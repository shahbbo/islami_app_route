import 'package:flutter/material.dart';
import 'package:islami_app/core/color_data.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  double turns = 0.0;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا اله الا الله',
    'استغفر الله',
    'لا حول ولا قوة الا بالله',
    'سبحان الله وبحمده',
    'سبحان الله العظيم',
    'اللهم صل وسلم وبارك على محمد',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('assets/images/sebha_bg.png'),
              fit: BoxFit.cover)),
      child: InkWell(
        autofocus: false,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() => turns += 1 / 33);
          _counter++;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }
          ;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }
          ;
          if (index == azkar.length) {
            index = 0;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: ColorData.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            azkar[index],
                            style: const TextStyle(
                                color: ColorData.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$_counter',
                            style: const TextStyle(
                                color: ColorData.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      AnimatedRotation(
                          turns: turns,
                          duration: const Duration(milliseconds: 50),
                          child: Image.asset(
                            'assets/images/SebhaBody.png',
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

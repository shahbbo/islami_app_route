import 'package:islami_app/core/resources/color_data.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int? currentSelection = 0;
  bool isPlaying = true;
  bool isVolume = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/radio_bg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 170),
            MaterialSegmentedControl(
              horizontalPadding: const EdgeInsets.all(16),
              children: children,
              selectionIndex: currentSelection,
              borderColor: Colors.grey,
              selectedColor: ColorData.gold,
              unselectedColor: Colors.transparent,
              selectedTextStyle: const TextStyle(color: Colors.black),
              unselectedTextStyle: const TextStyle(color: Colors.white),
              borderWidth: 0.7,
              borderRadius: 6.0,
              verticalOffset: 8.0,
              onSegmentTapped: (index) {
                setState(() {
                  currentSelection = index;
                });
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 141,
                      width: 390,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(isPlaying ? 'assets/images/radio_card.png' : 'assets/images/soundWave.png',),
                            alignment: isPlaying ? Alignment.center : Alignment.bottomCenter,
                          ),
                          color: ColorData.gold,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Radio Ibrahim Al-Akdar',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPlaying = !isPlaying;
                                    });
                                  },
                                  icon: Icon(isPlaying ? Icons.play_arrow : Icons.pause,
                                    size: 40,)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVolume = !isVolume;
                                    });
                                  },
                                  icon: Icon(isVolume ? Icons.volume_up : Icons.volume_off,
                                    size: 40,)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map<int, Widget> children = {
  0 : const Text(
    'Radio',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),
  1 : const Text(
    'Reciters',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),
};


import 'dart:math';
import 'package:islami_app/core/color_data.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int? _currentSelection = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/radio_bg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            MaterialSegmentedControl(
              horizontalPadding: const EdgeInsets.all(7),
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: ColorData.gold,
              unselectedColor: Colors.transparent,
              selectedTextStyle: const TextStyle(color: Colors.black),
              unselectedTextStyle: const TextStyle(color: Colors.white),
              borderWidth: 0.7,
              borderRadius: 6.0,
              disabledChildren: _disabledIndices,
              verticalOffset: 8.0,
              onSegmentTapped: (index) {
                setState(() {
                  _currentSelection = index;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                addRepaintBoundaries: false,
                reverse: false,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 141,
                        width: 390,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/radio_card.png')),
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 141,
                        width: 390,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/radio_card.png')),
                            color: ColorData.gold,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Radio Al-Qaria Yassen',
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 141,
                        width: 390,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/radio_card.png')),
                            color: ColorData.gold,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Radio Ahmed Al-trabulsi',
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 141,
                        width: 390,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/radio_card.png')),
                            color: ColorData.gold,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Radio Addokali Mohammad Alalim',
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 141,
                        width: 390,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/radio_card.png')),
                            color: ColorData.gold,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Radio Mohammad Ebrahim',
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 141,
                        width: 390,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/radio_card.png')),
                            color: ColorData.gold,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Radio Route',
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map<int, Widget> _children = {
  0: const Text(
    'Radio',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),
  1: const Text(
    'Reciters',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),
};
List<int> _disabledIndices = [];
int _randomInt() {
  return Random.secure().nextInt(_children.length);
}

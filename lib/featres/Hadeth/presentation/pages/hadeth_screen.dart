import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/color_data.dart';

import 'hadeth_details_screen.dart';
import '../../data/hadeth_modal.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethModal> hadethMatnList = [];

  @override
  void initState() {
    super.initState();
    loadHadethMatn();
  }

  void loadHadethMatn() async {
    for (int i = 1; i <= 50; i++) {
      String hadethMatn = await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethMatn.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModal hadethModal = HadethModal(title: title, matn: hadethLines);
      hadethMatnList.add(hadethModal);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/hadeth_bg.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .68,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 0,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
              itemCount: hadethMatnList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
                      arguments: hadethMatnList[itemIndex]);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/hadethCard_bg.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: ColorData.gold),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          hadethMatnList[itemIndex].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Text(
                            hadethMatnList[itemIndex].matn.join(''),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

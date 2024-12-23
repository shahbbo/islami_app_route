import 'package:flutter/material.dart';
import 'package:islami_app/featres/Quran/data/sura_modal.dart';
import 'package:islami_app/featres/Quran/presentation/pages/sura_details_screen.dart';

import '../../../../core/color_data.dart';
import '../widgets/sura_list.dart';


class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> filteredIndexes = List.generate(SuraModal.arabicSuraName.length, (index) => index);
  bool isSearching = false;
  List<SuraModal> recentSurahs = [];

  void addRecentSura(SuraModal sura) {
    setState(() {
      recentSurahs.removeWhere((recent) => recent.suraNumber == sura.suraNumber);
      recentSurahs.insert(0, sura);
      if (recentSurahs.length > 3) {
        recentSurahs.removeLast();
      }
    });
  }
  void filterSuras(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      filteredIndexes =
          List.generate(SuraModal.arabicSuraName.length, (index) => index)
              .where((index) =>
                  SuraModal.arabicSuraName[index].contains(query) ||
                  SuraModal.englishSurahName[index]
                      .toLowerCase()
                      .contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/quran_bg.png'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              TextField(
                style: const TextStyle(
                  color: ColorData.white,
                ),
                onChanged: filterSuras,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: ColorData.gold)),
                  fillColor: ColorData.lightBlack,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorData.gold),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: ColorData.gold, style: BorderStyle.solid),
                  ),
                  hintText: "Sura Name",
                  hintStyle: const TextStyle(
                    color: ColorData.white,
                  ),
                  prefixIcon: const ImageIcon(
                    AssetImage('assets/images/quran_icon.png'),
                    color: ColorData.gold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !isSearching,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: recentSurahs.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Most Recently',
                            style: TextStyle(color: ColorData.white),
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: recentSurahs.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 250,
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: ColorData.gold,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              recentSurahs[index].suraEnName,
                                              style: const TextStyle(
                                                  color: ColorData.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              recentSurahs[index].suraArName,
                                              style: const TextStyle(
                                                  color: ColorData.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Number of Verses: ${recentSurahs[index].numberOfAyat}',
                                              style: const TextStyle(
                                                  color: ColorData.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Image(
                                        image: AssetImage('assets/images/sura_recent_image.png'),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sura List',
                      style: TextStyle(color: ColorData.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredIndexes.length,
                  itemBuilder: (context, index) {
                    int suraIndex = filteredIndexes[index];
                    return InkWell(
                      onTap: () {
                        addRecentSura(SuraModal(
                          suraNumber: suraIndex,
                          numberOfAyat: SuraModal.numberOfAya[suraIndex],
                          suraEnName: SuraModal.englishSurahName[suraIndex],
                          suraArName: SuraModal.arabicSuraName[suraIndex],
                        ));
                        Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: SuraModal(
                            suraNumber: suraIndex,
                            numberOfAyat: SuraModal.numberOfAya[suraIndex],
                            suraEnName: SuraModal.englishSurahName[suraIndex],
                            suraArName: SuraModal.arabicSuraName[suraIndex],
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SuraList(
                            suraModal: SuraModal(
                              suraNumber: suraIndex,
                              numberOfAyat: SuraModal.numberOfAya[suraIndex],
                              suraEnName: SuraModal.englishSurahName[suraIndex],
                              suraArName: SuraModal.arabicSuraName[suraIndex],
                            ),
                          ),
                          const Divider(
                            color: ColorData.white,
                            thickness: 2,
                            endIndent: 50,
                            indent: 50,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/color_data.dart';
import 'package:islami_app/featres/Quran/data/sura_modal.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetailsScreen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  void loadSuraDetails(int index) async {
    String suraDetails = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraDetailsLines = suraDetails.split('\n');
    List<String> formattedAyat = [];
    for (int i = 0; i < suraDetailsLines.length; i++) {
      formattedAyat.add('${suraDetailsLines[i]}[${i + 1}]');
    }
    ayat = formattedAyat;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModal;
    if (ayat.isEmpty) {
      loadSuraDetails(args.suraNumber);
    }
    String ayatString = ayat.join(" ");
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorData.gold),
        centerTitle: true,
        title: Text(
          args.suraEnName,
          style: const TextStyle(
            color: ColorData.gold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.only(
            bottom: 100,
            right: 20,
            left: 20, ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/detailsScreen_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              " سورة ${args.suraArName}",
              style: const TextStyle(
                  color: ColorData.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25,),
            Expanded(
              child: ayat.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ColorData.gold,
                    ))
                  :SingleChildScrollView(
                    child: Text(
                                    ayatString,
                            style: const TextStyle(
                                color: ColorData.gold,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}

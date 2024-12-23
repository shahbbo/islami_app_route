import 'package:flutter/material.dart';
import 'package:islami_app/featres/Quran/data/sura_modal.dart';

import '../../../../core/color_data.dart';


class SuraList extends StatelessWidget {
  final SuraModal suraModal;


  const SuraList({super.key, required this.suraModal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Image(image: AssetImage('assets/images/Vector.png')),
              Text(
                '${suraModal.suraNumber+1}',
                style: const TextStyle(color: ColorData.white),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraModal.suraEnName,
                style: const TextStyle(
                    color: ColorData.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${suraModal.numberOfAyat} verses',
                style: const TextStyle(
                    color: ColorData.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Text(
            suraModal.suraArName,
            style: const TextStyle(
                color: ColorData.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

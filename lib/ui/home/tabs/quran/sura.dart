import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_list.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class Sura extends StatelessWidget {
  int index;

  Sura({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(Assets.suranumber),
              Text("${index + 1} ", style: TextStyle(color: AppColors.white)),
            ],
          ),
          SizedBox(width: width * 0.05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranList.englishQuranList[index],
                style: Styles.bold20white,
              ),
              Text(
                "${QuranList.versesNumber[index]}verses",
                style: Styles.bold14white,
              ),
            ],
          ),
          Spacer(),
          Text(QuranList.arabicQuranList[index], style: Styles.bold20white),
        ],
      ),
    );
  }
}

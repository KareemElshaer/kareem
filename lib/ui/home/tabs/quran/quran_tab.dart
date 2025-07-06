import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/suradetails1.dart';
import 'package:islami/ui/home/tabs/quran/most_recent_widget.dart';
import 'package:islami/ui/home/tabs/quran/quran_list.dart';
import 'package:islami/ui/home/tabs/quran/sura.dart';
import 'package:islami/utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../shared_ prefs.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterlist = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: Styles.bold16white,
            onChanged: (newtext) {
              searchNewText(newtext);
            },
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              prefixIcon: Image.asset(
                Assets.iconQuran,
                color: AppColors.primary,
              ),
              hintText: "sura name",
              hintStyle: Styles.bold16white,
            ),
          ),
          SizedBox(height: height * 0.02),
          MostRecentWidget(),
          SizedBox(height: height * 0.01),
          Text("suras list", style: Styles.bold16white),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: width * 0.05),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    SaveRcentSure(filterlist[index]);
                    Navigator.of(context).pushNamed(
                      Suradetails1.routename,
                      arguments: filterlist[index],
                    );
                  },
                  child: Sura(index: filterlist[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: AppColors.white,
                  thickness: 2,
                  endIndent: width * 0.05,
                  indent: width * 0.05,
                );
              },
              itemCount: filterlist.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchNewText(String newtext) {
    List<int> filterserch = [];
    for (int i = 0; i < QuranList.englishQuranList.length; i++) {
      if (QuranList.englishQuranList[i].toLowerCase().contains(newtext)) {
        filterserch.add(i);
      } else if (QuranList.arabicQuranList[i].contains(newtext)) {
        filterserch.add(i);
      }
    }
    filterlist = filterserch;
    setState(() {});
  }
}

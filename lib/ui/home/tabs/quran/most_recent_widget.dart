import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/suradetails1.dart';
import 'package:islami/ui/home/tabs/quran/quran_list.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../most_recent_provider.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecent mostRecent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecent.readRecentsura();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecent = Provider.of<MostRecent>(context);
    return Visibility(
      visible: mostRecent.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("most recently", style: Styles.bold16white),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.16,
            width: double.infinity,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Suradetails1.routename,
                      arguments: mostRecent.mostRecentList[index],
                    );
                  },
                  child: Container(
                    //width: width*95,
                    //height: height*0.16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                QuranList.englishQuranList[mostRecent
                                    .mostRecentList[index]],
                                style: Styles.bold24black,
                              ),
                              Text(
                                QuranList.arabicQuranList[mostRecent
                                    .mostRecentList[index]],
                                style: Styles.bold24black,
                              ),
                              Text(
                                '${QuranList.versesNumber[mostRecent.mostRecentList[index]]} verses',
                                style: Styles.bold14black,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(Assets.suraimage),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecent.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}

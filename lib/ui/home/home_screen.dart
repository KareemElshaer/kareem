import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int Selectedindex = 0;

  List<String> bg = [
    Assets.quranBg,
    Assets.hadethBG,
    Assets.sebhaBg,
    Assets.radioBg,
    Assets.timeBg,
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(
          bg[Selectedindex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: Selectedindex,
            onTap: (index) {
              Selectedindex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primary,
            items: [
              BottomNavigationBarItem(
                icon: builtbutton(0, Assets.iconQuran),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: builtbutton(1, Assets.iconHadeth),
                label: 'Hadeth',
              ),
              BottomNavigationBarItem(
                icon: builtbutton(2, Assets.iconSebha),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: builtbutton(3, Assets.iconRadio),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: builtbutton(4, Assets.iconTime),
                label: 'Time',
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.logo, height: height * 0.2),
              Expanded(child: tabs[Selectedindex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget builtbutton(int index, String image) {
    return Selectedindex == index
        ? Container(
            padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.backg,
            ),
            child: ImageIcon(AssetImage(image)),
          )
        : ImageIcon(AssetImage(image));
  }
}

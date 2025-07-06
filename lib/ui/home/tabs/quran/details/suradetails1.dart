import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/details/suracontent1.dart';
import 'package:islami/ui/home/tabs/quran/quran_list.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class Suradetails1 extends StatefulWidget {
  static const String routename = "suradetails1";

  Suradetails1({super.key});

  @override
  State<Suradetails1> createState() => _Suradetails1State();
}

class _Suradetails1State extends State<Suradetails1> {
  List<String> verses = [];
  late MostRecent mostRecent;

  @override
  void dispose() {
    super.dispose();
    mostRecent.readRecentsura();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecent = Provider.of<MostRecent>(context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSura(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranList.englishQuranList[index],
          style: Styles.bold20primary,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backg,
          image: DecorationImage(
            image: AssetImage('assets/images/sura bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * .02),
                child: Text(
                  textAlign: TextAlign.center,
                  QuranList.arabicQuranList[index],
                  style: Styles.bold24primary,
                ),
              ),
              SizedBox(height: height * 0.05),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Suracontent1(
                            suracontent: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: height * 0.02);
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSura(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split('\n');
    verses = lines;
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}

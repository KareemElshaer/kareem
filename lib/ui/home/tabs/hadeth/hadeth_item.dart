import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';
import '../../../../modal/content.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadeth(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage('assets/images/hadethbg1.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: hadeth == null
          ? Center(child: CircularProgressIndicator(color: AppColors.primary))
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.03,
                    right: width * 0.03,
                    left: width * 0.03,
                  ),
                  child: Text(hadeth?.title ?? "", style: Styles.bold24black),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.05),
                      child: Text(
                        textAlign: TextAlign.center,
                        hadeth?.content ?? '',
                        style: Styles.bold24black.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void loadHadeth(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Hadeeth/h$index.txt",
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}

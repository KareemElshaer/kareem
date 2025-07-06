import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio/radio_box.dart';
import 'package:islami/ui/home/tabs/radio/radio_list.dart';
import 'package:islami/utils/app_styles.dart';
import '../../../../utils/app_colors.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: width * 0.4,
              height: height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
              ),
              child: Text('Radio', style: Styles.bold16white),
            ),
            Container(
              alignment: Alignment.center,
              width: width * 0.4,
              height: height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xc2202020),
              ),
              child: Text('Reciters', style: Styles.bold16white),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: height * 0.02),
            itemBuilder: (BuildContext context, int index) {
              return RadioBox(
                Name: RadioName.radioList[index],
                image: RadioName.radiopic[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: height * 0.02);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}

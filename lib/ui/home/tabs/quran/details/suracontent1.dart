import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

import '../../../../../utils/app_styles.dart';

class Suracontent1 extends StatelessWidget {
  int index;
  String suracontent;

  Suracontent1({super.key, required this.index, required this.suracontent});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Text(
        textAlign: TextAlign.center,
        "[${index + 1}  $suracontent",
        style: Styles.bold20primary,
      ),
    );
  }
}

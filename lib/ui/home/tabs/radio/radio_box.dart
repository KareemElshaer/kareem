import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class RadioBox extends StatelessWidget {
  String Name;

  IconData firsticon;

  String image;

  RadioBox({
    super.key,
    required this.Name,
    this.firsticon = (Icons.play_arrow),
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    int index = 0;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      width: double.infinity,
      height: height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage(image),
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Name, style: Styles.bold20white.copyWith(color: Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(firsticon, size: 50),
              Icon(Icons.volume_up, color: Colors.black, size: 40),
            ],
          ),
        ],
      ),
    );
  }
}

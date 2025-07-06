import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/sebha/tasbeh.dart';
import 'package:islami/utils/app_colors.dart';
import 'dart:math';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0.0;
  int count = 0;
  int index = 0;
  final double anglePerPress = 2 * pi / 33;

  void rotate() {
    setState(() {
      count++;
      angle += anglePerPress;

      if (count > 33) {
        count = 0;
        angle = 0.0;
        index = (index + 1) % Tasbeh.sebha.length;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'خلصت 33 تسبيحة!',
              style: Styles.bold20white,
              textAlign: TextAlign.center,
            ),
            backgroundColor: AppColors.transparent,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: Styles.bold20white.copyWith(fontSize: 36),
        ),
        Stack(
          children: [
            GestureDetector(
              onTap: rotate,
              child: Transform.rotate(
                angle: angle,
                child: Image.asset(
                  Assets.sebhaPic,
                  width: double.infinity,
                  height: height * 0.6,
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  Text(
                    '${Tasbeh.sebha[index]}',
                    style: Styles.bold20white.copyWith(fontSize: 36),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    '$count',
                    style: Styles.bold20white.copyWith(fontSize: 36),
                  ),
                ],
              ),
              top: height * 0.25,
              left: width * 0.3,
            ),
          ],
        ),
      ],
    );
  }
}

/*
Text(
              'عدد التسبيحات: $_count / 33',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
 */

/*
GestureDetector(
              onTap: _rotate,
              child: Transform.rotate(
                angle: _angle,
                child:Image.asset(Assets.sebhaPic,width: double.infinity,height: height*0.6)
              ),
            ),
 */

/*import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../../utils/app_assets.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    var height = MediaQuery.of(context).size.height ;
    return Column(
      children: [
      Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ', style: Styles.bold20white.copyWith(fontSize: 36),) ,

      ],
    );
  }
}
 Stack(
         children:[
           Image.asset(Assets.sebhaPic,width: double.infinity,height: height*0.6),
           Positioned(child: Column(
             children: [
               Text('سبحان الله',style: Styles.bold20white.copyWith(fontSize: 36),),
               SizedBox(height: height*0.03),
               Text('30',style: Styles.bold20white.copyWith(fontSize: 36),),
             ],
           ),top: height*0.25,left: width*0.3,)
         ],
       )
 */

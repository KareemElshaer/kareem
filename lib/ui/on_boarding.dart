import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'home/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routename = 'OnBoardingPage';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return IntroductionScreen(
      globalBackgroundColor: AppColors.black,
      pages: [
        PageViewModel(
          titleWidget: Image.asset(Assets.logo, width: double.infinity),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.on1,
                height: height * 0.4,
                width: double.infinity,
              ),
              SizedBox(height: height * 0.028),
              Text('Welcome To Islmi App', style: Styles.bold24primary),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(Assets.logo, width: double.infinity),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/on2.png',
                height: height * 0.4,
                width: double.infinity,
              ),
              SizedBox(height: height * 0.028),
              Text('Welcome To Islami', style: Styles.bold24primary),
              SizedBox(height: height * 0.028),
              Text(
                'We Are Very Excited To Have You In Our Community',
                style: Styles.bold20primary,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(Assets.logo, width: double.infinity),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/on3.png',
                height: height * 0.4,
                width: double.infinity,
              ),
              SizedBox(height: height * 0.028),
              Text('Reading the Quran', style: Styles.bold24primary),
              SizedBox(height: height * 0.028),
              Text(
                'Read, and your Lord is the Most Generous',
                style: Styles.bold20primary,
              ),
            ],
          ),
        ),

        PageViewModel(
          titleWidget: Image.asset(Assets.logo, width: double.infinity),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/on4.png',
                height: height * 0.4,
                width: double.infinity,
              ),
              SizedBox(height: height * 0.028),
              Text('Bearish', style: Styles.bold24primary),
              SizedBox(height: height * 0.028),
              Text(
                'Praise the name of your Lord, the Most High',
                style: Styles.bold20primary,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(Assets.logo, width: double.infinity),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/on5.png',
                height: height * 0.4,
                width: double.infinity,
              ),
              SizedBox(height: height * 0.020),
              Text('Holy Quran Radio', style: Styles.bold24primary),
              SizedBox(height: height * 0.02),
              Text(
                'You can listen to the Holy Quran Radio \nthrough the application for free and easily',
                style: Styles.bold20primary,
              ),
            ],
          ),
        ),
      ],
      back: Text("Back", style: Styles.bold20primary),
      showBackButton: true,
      onDone: () {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      next: Text("Next", style: Styles.bold16primary),
      done: Text("Finish", style: Styles.bold16primary),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black26,
        activeSize: Size(22.0, 10.0),
        activeColor: AppColors.primary,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

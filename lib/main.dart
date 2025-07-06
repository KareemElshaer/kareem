import 'package:flutter/material.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/details/suradetails1.dart';
import 'package:islami/ui/on_boarding.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => MostRecent(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingPage.routename,
      routes: {
        OnBoardingPage.routename: (context) => OnBoardingPage(),
        HomeScreen.routename: (context) => HomeScreen(),
        Suradetails1.routename: (context) => Suradetails1(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

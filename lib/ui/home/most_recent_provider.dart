import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/shared_%20prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecent extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readRecentsura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesListasString =
        prefs.getStringList(SharedPrefs.mostrecent) ?? [];
    mostRecentList = mostRecentIndicesListasString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}

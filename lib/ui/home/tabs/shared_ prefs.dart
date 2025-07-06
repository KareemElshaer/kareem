import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String mostrecent = 'most_recent';
}

void SaveRcentSure(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPrefs.mostrecent) ?? [];
  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    mostRecentIndicesList.remove('$mostRecentIndicesList');
    mostRecentIndicesList.insert(0, "$newSuraIndex");
  } else {
    mostRecentIndicesList.insert(0, "$newSuraIndex");
  }
  if (mostRecentIndicesList.length > 5) {
    mostRecentIndicesList.removeLast();
  }
  await prefs.setStringList(SharedPrefs.mostrecent, mostRecentIndicesList);
}

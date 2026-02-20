import 'package:shared_preferences/shared_preferences.dart';

class OnbordingServices {
  static late SharedPreferences sharedPref;
 static Future initializeshared() async {
    sharedPref = await SharedPreferences.getInstance();

  }
 static bool isFristTime() {
    return sharedPref.getBool("isFristTime") ?? true;
  }
  static setFristTime() {
    sharedPref.setBool("isFristTime", false);
  }
}

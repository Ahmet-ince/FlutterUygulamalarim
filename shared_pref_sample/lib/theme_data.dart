import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.green.shade300),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.red.shade300),
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  static late SharedPreferences _sharedPrefObject;
  bool _isGreen = true;
  bool get isGreen => _isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSharedPref(_isGreen); // Temayı değiştirdikten sonra kaydedin
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPrefObject.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() async {
    //await createSharedPrefObject();
    _isGreen = _sharedPrefObject.getBool('themeData') ?? true;
  }
}

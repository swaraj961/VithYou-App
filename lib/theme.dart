import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? Color(0xffE94560) : Color(0xfff06292),
      accentColor: isDarkTheme ? Color(0xff55cec7) : Colors.blueAccent,
      fontFamily: 'GoogleSans',
      backgroundColor: isDarkTheme ? Color(0xff16213E) : Color(0xfffbdbf4),
      cardColor: isDarkTheme ? Color(0xffE94560) : Color(0xffffffff),
      canvasColor: isDarkTheme ? Colors.green : Color(0xff42a5f5),
      buttonColor: isDarkTheme ? Color(0xffFF0000) : Color(0xff009c96),
      splashColor: isDarkTheme ? Color(0xffff77a9) : Color(0xffb4004e),
      disabledColor: Colors.grey,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
    );
  }
}

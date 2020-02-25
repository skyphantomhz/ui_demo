import 'package:animationdemo/global/theme/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  ThemeData _themeData;
  ThemeChanger(this._themeData);
  
  getThemeData() => _themeData;

  setThemeData(AppTheme appTheme){
    switch (appTheme) {
      case AppTheme.GreenLight:
        _themeData = appThemeData['Green Light'];
        break;

      case AppTheme.GreenDark:
        _themeData = appThemeData['Green Dark'];
        break;

      case AppTheme.BlueLight:
        _themeData = appThemeData['Blue Light'];
        break;

      case AppTheme.BlueDark:
        _themeData = appThemeData['Blue Dart'];
        break;

      default:
    }

    notifyListeners();
  }
}
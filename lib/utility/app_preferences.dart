import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  static Future<String> getStringF(String key) async {
    var instance = await _prefs;
    return instance.getString(key);
  }

  static Future<double> getDoubleF(String key) async {
    var instance = await _prefs;
    return instance.getDouble(key);
  }

  static Future<int> getIntF(String key) async {
    var instance = await _prefs;
    return instance.getInt(key);
  }

  static Future<bool> getBoolF(String key) async {
    var instance = await _prefs;
    return instance.getBool(key);
  }

  static Future<bool> setString(String key, String value) async {
    var instance = await _prefs;
    return instance.setString(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    var instance = await _prefs;
    return instance.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    var instance = await _prefs;
    return instance.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var instance = await _prefs;
    return instance.setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    var instance = await _prefs;
    return instance.remove(key);
  }

  static Future<bool> clear() async {
    var instance = await _prefs;
    return instance.clear();
  }
}

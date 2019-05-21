import 'dart:convert';

import 'package:arabic_reader/models/app_state.dart';
import 'package:arabic_reader/models/hymn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils {
  static PreferencesUtils _instance;
  final SharedPreferences preferences;

  PreferencesUtils._(this.preferences);

  static Future<PreferencesUtils> getInstance() async {
    if (_instance == null) {
      final pref = await SharedPreferences.getInstance();
      _instance = PreferencesUtils._(pref);
    }
    return _instance;
  }

  AppState getAppState() {
    final hymnsStr = preferences.getStringList(FAV_HYMNS) ?? [];
    return AppState(
      hymns: hymnsStr.map((str) => Hymn.fromJson(json.decode(str))).toList(),
      size: preferences.getInt(FONT_SIZE) ?? 16,
      isDark: preferences.getBool(IS_DARK_THEME) ?? false,
    );
  }

  void saveAppState(AppState state) {
    preferences.setBool(IS_DARK_THEME, state.isDark);
    preferences.setInt(FONT_SIZE, state.fontSize);
    preferences.setStringList(
      FAV_HYMNS,
      state.favHymns
          .map(
            (hymn) => json.encode(
                  hymn.toJson(),
                ),
          )
          .toList(),
    );
  }

  static const FAV_HYMNS = "fav_hymns";
  static const FONT_SIZE = "font_size";
  static const IS_DARK_THEME = "is_dark";
}

import 'package:arabic_reader/screens/Categories/index.dart';
import 'package:arabic_reader/screens/Favorites/index.dart';
import 'package:arabic_reader/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/app_state.dart';
import 'screens/Settings/index.dart';

void main() async {
  final prefUtils = await PreferencesUtils.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<PreferencesUtils>.value(value: prefUtils),
        ChangeNotifierProvider<AppState>.value(
            notifier: prefUtils.getAppState()),
      ],
      child: Consumer<AppState>(
        builder: (BuildContext context, AppState state, Widget child) {
          final theme = state.isDark ? ThemeData.dark() : ThemeData();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme.copyWith(
              textTheme: theme.textTheme.copyWith(
                title: theme.textTheme.title.copyWith(
                    fontSize: state.fontSize.toDouble(),
                    fontWeight: FontWeight.w300),
              ),
            ),
            routes: {
              "/settings": (context) => SettingsScreen(),
              "/favorites": (context) => FavoritesScreen(),
            },
            home: CategoryScreen(),
          );
        },
      ),
    ),
  );
}

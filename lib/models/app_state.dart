import 'package:flutter/foundation.dart';

import 'hymn.dart';

class AppState extends ChangeNotifier {
  AppState({List<Hymn> hymns, int size, bool isDark}) {
    _favHymns = hymns;
    _fontSize = size;
    _isDark = isDark;
  }
  List<Hymn> _favHymns;
  int _fontSize;
  bool _isDark;

  List<Hymn> get favHymns => _favHymns;

  addHymn(Hymn value) {
    _favHymns.add(value);
    notifyListeners();
  }

  remove(Hymn value) {
    final index = _favHymns.indexWhere((hymn) => hymn.title == value.title);
    if (index == -1) return;
    _favHymns.removeAt(index);
    notifyListeners();
  }

  int get fontSize => _fontSize;

  set fontSize(int size) {
    _fontSize = size;
    notifyListeners();
  }

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

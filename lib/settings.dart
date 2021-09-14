import 'package:flutter/widgets.dart';

class MySettings extends ChangeNotifier {
  bool _isDark = false;

  get isDrak => _isDark;

  void setTheme(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

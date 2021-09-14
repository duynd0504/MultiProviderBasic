import 'package:flutter/widgets.dart';

class Counter extends ChangeNotifier {
  int _counter = 0;
  get myValue => _counter;

  void add() {
    _counter++;

    notifyListeners();
  }
}

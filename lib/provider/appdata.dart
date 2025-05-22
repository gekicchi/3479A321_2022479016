import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  String _username = 'yo el gorila';
  bool _restart = false;

  int get counter => _counter;
  String get username => _username;
  bool get restart => _restart;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void changeUsername(String newName) {
    _username = newName;
    notifyListeners();
  }

  void toggleRestart() {
    _restart = !_restart;
    notifyListeners();
  }
}

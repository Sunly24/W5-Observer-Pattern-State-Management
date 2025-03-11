import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier {
  int _redTaps = 0;
  int _blueTaps = 0;
  int _currentIndex = 0;

  int get redTaps => _redTaps;
  int get blueTaps => _blueTaps;
  int get currentIndex => _currentIndex;

  void incrementRed() {
    _redTaps++;
    notifyListeners();
  }

  void incrementBlue() {
    _blueTaps++;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

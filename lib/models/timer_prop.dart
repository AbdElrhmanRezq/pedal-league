import 'package:flutter/material.dart';

class TimerProp extends ChangeNotifier {
  int seconds = 60 * 8;

  void setTimer(double minutes) {
    seconds = (minutes * 60).toInt();
    notifyListeners();
  }
}

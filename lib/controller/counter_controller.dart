import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void multy2x() {
    _counter = _counter * 2;
    notifyListeners();
  }

  void multy3x() {
    _counter = _counter * 3;
    notifyListeners();
  }

  void multy4x() {
    _counter = _counter * 4;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ProviderPlatform with ChangeNotifier {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  int selectedPageIndex = 0;
  PageController pageController = PageController();

  void setPage(int index) {
    selectedPageIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void changeTime({required t1}) {
    time = t1;
    notifyListeners();
  }

  void changeDate({required d1}) {
    date = d1;
    notifyListeners();
  }

  bool isAndroid = true;

  void changePlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}

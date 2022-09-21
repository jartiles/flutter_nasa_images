import 'package:flutter/material.dart';

class NavigationServices extends ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = PageController();

  int get getActualPage => _actualPage;

  PageController get getPageController => _pageController;

  set setActualPage(int index) {
    _actualPage = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}

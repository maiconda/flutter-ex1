import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier{

  static AppController instance = AppController();

  bool themeState = true;
  int counter = 0;

  incrementCounter(){
    counter++;
    notifyListeners();
  }

  decrementCounter(){
    counter--;
    notifyListeners();
  }

  changeTheme(){
    themeState = !themeState;
    notifyListeners();
  }
}

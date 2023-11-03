import 'package:flutter/material.dart';
import 'package:duasd/app_controller.dart';
import 'package:duasd/login_page.dart';
import 'home_widget.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
      return MaterialApp(
        theme: ThemeData(
            primarySwatch: AppController.instance.themeState ? Colors.blue : Colors.orange ,
            brightness: AppController.instance.themeState ? Brightness.light : Brightness.dark,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => Home(),
        }
        ,
      );
    },);
  }
}
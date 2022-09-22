import 'package:drawer_ui_challege/Pages/home_page.dart';
import 'package:drawer_ui_challege/Pages/seccond_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static const homeRoute = "/";
  static const secondRoute = "/second";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case secondRoute:
        return MaterialPageRoute(builder: (context) {
          return const SecondPage();
        });
      default:
        {
          return MaterialPageRoute(builder: (context) {
            return const HomePage();
          });
        }
    }
  }
}

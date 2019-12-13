import 'package:flutter/material.dart';

import 'package:demo1_app/navigations/bottom_navigation.dart';
import 'package:demo1_app/uis/pages/home.dart';
import 'package:demo1_app/uis/pages/signup.dart';

class HomeNavigatorRoutes {
  static const String root = '/';
  static const String signup = '/signup';
}

class HomeNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  HomeNavigator({this.navigatorKey, this.tabItem});

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context)
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return 
    {
      HomeNavigatorRoutes.root: (context) => HomePage(title: 'Home'),
      HomeNavigatorRoutes.signup: (context) => SignupPage()
    };
  }
}
import 'package:flutter/material.dart';

import 'package:demo1_app/navigations/bottom_navigation.dart';
import 'package:demo1_app/uis/pages/networking.dart';

class NetworkingNavigatorRoutes {
  static const String root = '/';
}

class NetworkingNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  NetworkingNavigator({this.navigatorKey, this.tabItem});

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: NetworkingNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context)
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      NetworkingNavigatorRoutes.root: (context) => NetworkingPage(title: 'Networking')
    };
  }
}
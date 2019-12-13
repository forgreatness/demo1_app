import 'package:flutter/material.dart';

import 'package:demo1_app/navigations/bottom_navigation.dart';
import 'package:demo1_app/uis/pages/profile.dart';

class ProfileNavigatorRoutes {
  static const String root = '/';
}

class ProfileNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  ProfileNavigator({this.navigatorKey, this.tabItem});

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context)
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      ProfileNavigatorRoutes.root: (context) => ProfilePage(title: 'Profile')
    };
  }
}
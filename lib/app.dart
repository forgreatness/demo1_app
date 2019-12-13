import 'package:flutter/material.dart';

import 'package:demo1_app/navigations/bottom_navigation.dart';
import 'package:demo1_app/navigations/navigators/home.dart';
import 'package:demo1_app/navigations/navigators/profile.dart';
import 'package:demo1_app/navigations/navigators/networking.dart';

Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.person: GlobalKey<NavigatorState>(),
  TabItem.group: GlobalKey<NavigatorState>()
};

Map<TabItem, Widget> tabNavigator = {
  TabItem.home: HomeNavigator(navigatorKey: _navigatorKeys[TabItem.home], tabItem: TabItem.home,),
  TabItem.person: ProfileNavigator(navigatorKey: _navigatorKeys[TabItem.person], tabItem: TabItem.person,),
  TabItem.group: NetworkingNavigator(navigatorKey: _navigatorKeys[TabItem.group], tabItem: TabItem.group,)
};

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TabItem _currentTab = TabItem.home;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstateNavigator(TabItem.home),
            _buildOffstateNavigator(TabItem.person),
            _buildOffstateNavigator(TabItem.group),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      )
    );
  }

  Widget _buildOffstateNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: tabNavigator[tabItem]
    );
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }
}
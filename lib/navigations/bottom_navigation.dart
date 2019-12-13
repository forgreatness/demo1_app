import 'package:flutter/material.dart';

enum TabItem { home, person, group }

Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.person: 'Profile',
  TabItem.group: 'Networking'
};

Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.person: Icons.person,
  TabItem.group: Icons.group
};

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomNavigation({this.currentTab, this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: TabItem.values.indexOf(currentTab),
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.person),
        _buildItem(tabItem: TabItem.group)
      ],
      onTap: (index) => onSelectTab (TabItem.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon
      ),
      title: Text(
        text,
      )
    );
  }
}
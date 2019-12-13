import 'package:flutter/material.dart';

import 'package:demo1_app/uis/views/login.dart';
import 'package:demo1_app/uis/views/signup.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/click_icon.png',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: new DefaultTabController(
        length: 2,
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: customTabBar(),
              alignment: Alignment.center,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  LoginView(),
                  SignupView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customTabBar() {
    return TabBar(
      labelStyle: TextStyle(
        fontSize: 20,
      ),
      indicatorColor: Colors.green[900],
      isScrollable: true,
      tabs: <Widget>[
        Tab(
          child: Text(
            'LOG IN',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          
        ),
        Tab(
          child: Text(
            'SIGN UP',
            style: TextStyle(
              color: Colors.black
            ),
          )
        )
      ],
    );
  }
}
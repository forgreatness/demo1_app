import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String title;

  ProfilePage({Key key, this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Jane Smith',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'janesmith@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.withOpacity(0.8)
                  )
                )
              ],
            ),
            SizedBox(height: 40,),
            buildNavTabs('Personal Info'),
            SizedBox(height: 30),
            buildNavTabs('Notifications'),
            SizedBox(height: 30),           
            buildNavTabs('Email'),
            SizedBox(height: 30),
            buildNavTabs('Security'),
            SizedBox(height: 30),
            buildNavTabs('Advanced')
          ],
        ),
      )
    );
  }

  Widget buildNavTabs(String header) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          '$header',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[600],
          size: 20
        )
      ],
    );
  }
}
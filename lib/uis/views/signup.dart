import 'package:flutter/material.dart';

import 'package:demo1_app/widgets/buttons/signin_with.dart';

class SignupView extends StatelessWidget {
  SignupView({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/networking.png',
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(30, 20, 40, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey[400],
                      width: 1,
                      style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                    Text(
                        ('sign up with email').toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        )
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                const SizedBox(height: 10),
                SignInWithButton(federatedIdentity: 'facebook',),
                const SizedBox(height: 10),
                SignInWithButton(federatedIdentity: 'google',),
                const SizedBox(height: 10),
                SignInWithButton(federatedIdentity: 'apple',),
                const SizedBox(height: 10),
                FlatButton(
                  child: Text(
                    'continue as guest'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

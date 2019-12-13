import 'package:flutter/material.dart';

import 'package:demo1_app/widgets/buttons/signin_with.dart';

class LoginView extends StatefulWidget {
 LoginView({Key key}) : super(key:key);

 @override
 _LoginViewState createState() {
   return _LoginViewState();
 }
}

class _LoginViewState extends State<LoginView> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container (
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username/Email *'
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
                      tooltip: _hidePassword ? 'Hide Password' : 'Show Password',
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                    ),
                    hintText: 'Password *',
                  ),
                  obscureText: _hidePassword,
                ),
                GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SignInWithButton(federatedIdentity: 'facebook'),
                  const SizedBox(height: 10),
                  SignInWithButton(federatedIdentity: 'google'),
                  const SizedBox(height: 10),
                  SignInWithButton(federatedIdentity: 'apple'),
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
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Colors.blue[900],
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      )
    );
  }
}
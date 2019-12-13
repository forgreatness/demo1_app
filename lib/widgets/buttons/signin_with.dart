import 'package:flutter/material.dart';

class SignInWithButton extends StatelessWidget {
  final String federatedIdentity;

  SignInWithButton({Key key, this.federatedIdentity}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            'assets/images/'+federatedIdentity+'_icon.png',
            width: 24.0,
            height: 24.0
          ),
          Text(
            ('continue with '+federatedIdentity).toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            )
          ),
          SizedBox(width: 1)
        ],
      ),
      onPressed: () {},
    );
  }
}
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key:key);

  @override
  _SignupPageState createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  bool _hidePassword;
  bool _hideConfirmPassword;
  bool _termsAndConditionAgreement;
  bool _receiveEmailAndOffers;

  @override
  void initState() {
    _hidePassword = true;
    _hideConfirmPassword = true;
    _termsAndConditionAgreement = false;
    _receiveEmailAndOffers = false;
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Your Information',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                )
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
                keyboardType: TextInputType.emailAddress
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name'
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name'
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: TextEditingController(
                  text: '92252'
                ),
                decoration: InputDecoration(
                  helperText: 'To receive local offers in your area...',
                  helperStyle: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                )
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
                  hintText: _hidePassword ? '*********' : 'Passw0rd!',
                  helperText: 'Password must be at least 8 characters\nInclude one upper and one lower case character\nInclude one number and one symbol'
                ),
                obscureText: _hidePassword,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(_hideConfirmPassword ? Icons.visibility_off : Icons.visibility),
                    tooltip: _hideConfirmPassword ? 'Hide Password' : 'Show Password',
                    onPressed: () {
                      setState(() {
                        _hideConfirmPassword = !_hideConfirmPassword;
                      });
                    },
                  ),
                  hintText: _hideConfirmPassword ? '•••••••••' : 'Passw0rd!',
                ),
                obscureText: _hideConfirmPassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Checkbox(
                    value: _receiveEmailAndOffers,
                    checkColor: Colors.white,
                    activeColor: Colors.grey[700],
                    onChanged: (bool newValue) {
                      setState(() {
                        _receiveEmailAndOffers = newValue;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'Yes, I would like to receive email messages about special offers',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: _termsAndConditionAgreement,
                    checkColor: Colors.white,
                    activeColor: Colors.grey[700],
                    onChanged: (bool newValue) {
                      setState(() {
                        _termsAndConditionAgreement = newValue;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'I agree to the Terms & Conditions and Privacy Statement',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      )
                    )
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }
}
import 'package:a_tpa/screens/register.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Explicit

// Method
  Widget showLogo() {
    return Container(
      width: 160.0,
      height: 160.0,
      child: Image.asset(
        'images/logo.png',
      ),
    );
  }

  Widget showText() {
    return Text(
      'A TPA',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.lightGreenAccent[700],
        fontWeight: FontWeight.bold,
        fontFamily: 'Notable',
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

  Widget sighInButton() {
    return RaisedButton(
      color: Colors.lightGreenAccent[700],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget sighUpBotton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click Sigh Up');

// Crate Route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
            Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: sighInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: sighUpBotton(),
          ),
        ],
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.blue[200]],
              radius: 2.0,
              center: Alignment.topCenter,
            ),
          ),
          padding: EdgeInsets.only(top: 60.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              showLogo(),
              showText(),
              emailText(),
              passwordText(),
              showButton(),
            ],
          )),
    );
  }
}

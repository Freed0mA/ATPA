import 'package:a_tpa/screens/my_service.dart';
import 'package:a_tpa/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Explicit
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;

  String get value => null;

// Method
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      // moveToService();
    }
  }

  void moveToService() {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Email';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
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
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please Fill Password';
            }
          },
          onSaved: (String value) {
            passwordString = value;
          }),
    );
  }

  Widget sighInButton() {
    return RaisedButton(
      color: Colors.lightGreenAccent[700],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    print('Email = $emailString, password = $passwordString');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(
        email: emailString, password: passwordString).then((response){
          moveToService();
          }).catchError((response){
            String messageString = response.message;
            print('message = $messageString');
          });
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                showLogo(),
                showText(),
                emailText(),
                passwordText(),
                showButton(),
              ],
            ),
          )),
    );
  }
}

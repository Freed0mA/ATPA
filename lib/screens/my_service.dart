import 'dart:io';

import 'package:a_tpa/screens/show_list_video.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameString = '';

  // Method
  Widget showTitleAppBar() {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text('My Service'),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Login by $nameString',
              style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findName();
  }

  Future<void> findName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameString = firebaseUser.displayName;
    });
    print('name = $nameString');
  }

  Future<void> signOutAndExit() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  Widget showAppName() {
    return Text(
      'A TPA',
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget myDreawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[200],
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  showLogo(),
                  showAppName(),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 36.0,
            ),
            title: Text(
              'Sign Out & Exit',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              signOutAndExit();
              // Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreenAccent[700],
        title: showTitleAppBar(),
      ),
      body: ShowListVideo(),
      drawer: myDreawerMenu(),
    );
  }
}

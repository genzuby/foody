import 'package:flutter/material.dart';
import 'package:foodprj/services/auth.dart';
import 'package:foodprj/settings/global.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.mainRed,
        elevation: 0.0,
        title: Text(
          'Home',
          style: TextStyle(color: Global.white),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Sign Out'),
            textColor: Global.white,
          )
        ],
      ),
      body: Text('Home'),
    );
  }
}

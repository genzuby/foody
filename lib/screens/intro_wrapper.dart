import 'package:flutter/material.dart';
import 'package:foodprj/models/user.dart';
import 'package:foodprj/screens/home/home.dart';
import 'package:foodprj/screens/intro/intro_main.dart';
import 'package:provider/provider.dart';

class IntroWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return IntroMain();
    } else {
      return Home();
    }
  }
}

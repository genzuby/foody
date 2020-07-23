import 'package:flutter/material.dart';
import 'package:foodprj/models/user.dart';
import 'package:foodprj/screens/intro_wrapper.dart';
import 'package:foodprj/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: IntroWrapper(),
      ),
    );
  }
}

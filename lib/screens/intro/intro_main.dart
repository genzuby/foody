import 'package:flutter/material.dart';
import 'package:foodprj/screens/auth/signin.dart';
import 'package:foodprj/screens/auth/signup.dart';
import '../../settings/global.dart';
import 'package:foodprj/widgets/auth_button.dart';

class IntroMain extends StatefulWidget {
  @override
  _IntroMainState createState() => _IntroMainState();
}

class _IntroMainState extends State<IntroMain> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 400,
            color: Global.mainRed,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mukbo',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 48.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AuthButton(
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => SignIn()));
                  },
                  title: 'Sign In with E-Mail',
                  hasBorder: false,
                  bgColor: Global.mainRed,
                ),
                SizedBox(height: 10.0),
                AuthButton(
                  onPress: () {},
                  title: 'Sign In with Google',
                  bender: 'assets/google.png',
                  hasBorder: true,
                  bgColor: Global.googleRed,
                ),
                SizedBox(height: 10.0),
                AuthButton(
                  onPress: () {},
                  title: 'Sign In with facebook',
                  bender: 'assets/facebook.png',
                  hasBorder: true,
                  bgColor: Global.facebookBlue,
                ),
                SizedBox(height: 10.0),
                AuthButton(
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => SignUp()));
                  },
                  title: 'Sign Up with E-Mail',
                  hasBorder: true,
                  bgColor: Global.mainRed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodprj/screens/common/loading.dart';
import 'package:foodprj/screens/home/home.dart';
import 'package:foodprj/services/auth.dart';
import 'package:foodprj/screens/common/global.dart';
import 'package:foodprj/screens/widgets/authbutton_widget.dart';
import 'package:foodprj/screens/widgets/textinput_widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign In'),
              backgroundColor: Global.mainRed,
              elevation: 0.0,
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: keyboardOpen
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormInputWidget(
                      hintText: 'email',
                      obscureText: false,
                      prefixIconData: Icons.mail_outline,
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormInputWidget(
                      hintText: 'password',
                      obscureText: true,
                      prefixIconData: Icons.lock_outline,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long.'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    AuthButtonWidget(
                      onPress: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Could not signin with those credentials';
                              loading = false;
                            });
                          } else {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }
                        }
                      },
                      title: 'Sign In',
                      hasBorder: false,
                      bgColor: Global.mainRed,
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Visibility(
                          visible: keyboardOpen ? false : true,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Global.mainRed),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Global.secondRed, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

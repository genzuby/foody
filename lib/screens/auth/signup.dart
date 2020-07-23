import 'package:flutter/material.dart';
import 'package:foodprj/screens/home/home.dart';
import 'package:foodprj/services/auth.dart';
import 'package:foodprj/settings/global.dart';
import 'package:foodprj/widgets/auth_button.dart';
import 'package:foodprj/widgets/textinput_widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long.' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              AuthButton(
                onPress: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'Please supply a valid email');
                    } else {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  }
                },
                title: 'Sign Up',
                hasBorder: true,
                bgColor: Global.mainRed,
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

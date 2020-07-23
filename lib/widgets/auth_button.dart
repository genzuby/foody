import 'package:flutter/material.dart';
import '../settings/global.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final Color bgColor;
  final Function onPress;
  final String bender;

  AuthButton(
      {this.title, this.hasBorder, this.bgColor, this.onPress, this.bender});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: onPress,
        color: hasBorder ? Global.white : bgColor,
        shape: RoundedRectangleBorder(
            side:
                BorderSide(color: bgColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (bender != null)
                  Image.asset(
                    bender,
                    width: 26.0,
                    height: 26.0,
                  ),
                if (bender != null) SizedBox(width: 20.0),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      color: hasBorder ? bgColor : Global.white),
                ),
              ],
            )),
      ),
    );
  }
}

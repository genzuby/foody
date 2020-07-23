import 'package:flutter/material.dart';
import 'package:foodprj/settings/global.dart';

class TextFormInputWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final Function validator;

  TextFormInputWidget(
      {this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(
        color: Global.mainRed,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        labelText: hintText,
        filled: true,
        prefixIcon: Icon(
          prefixIconData,
          size: 20.0,
          color: Global.mainRed,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Global.mainRed)),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        suffixIcon: Icon(suffixIconData, size: 20.0, color: Global.mainRed),
        labelStyle: TextStyle(color: Global.mainRed),
        focusColor: Global.mainRed,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprj/screens/common/global.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Global.mainRed,
      child: Center(
        child: SpinKitChasingDots(
          color: Global.white,
          size: 70.0,
        ),
      ),
    );
  }
}

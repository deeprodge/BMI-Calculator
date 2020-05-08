import 'package:flutter/material.dart';
import 'inputPage.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';




Widget cardLogo(IconData a,String b){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        a,
        size:kIconSize,
        color: kIconColor,
      ),
      SizedBox(
        height: kSpaceBetIconText,
      ),
      Text(
        b,
        style: klabelTextStyle,
      ),
    ],
  );
}
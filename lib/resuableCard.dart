import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {
  final Function onPress;
  ReusableCard({@required this.colour,this.cardChild,this.onPress});
  final Color colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,

      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),

    )
    );
  }
}

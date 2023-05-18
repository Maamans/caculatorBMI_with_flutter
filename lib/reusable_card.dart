import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  ReUsableCard({required this.colour,  this.childCard, this.onPress});
  
  final Color colour;
  final Widget? childCard;
  final Function()? onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
        
        // width: 130,
        height: 120,
      ),
    );
  }
}

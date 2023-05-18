
import 'package:flutter/material.dart';
import 'package:caculator/constant.dart';
class IconContent extends StatelessWidget {
   IconContent({this.icon, this.label});


  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Icon(icon, size: 60,), 
         SizedBox(
          height: 5,
         ), 
         Text(label!, style: klabelTextStyle)
        ],
      );
  }
}
import 'package:flutter/material.dart';

class MyRoundActionButton extends StatelessWidget {
  MyRoundActionButton({required this.icon, required this.onpressed});
    final IconData? icon;
    final VoidCallback? onpressed;


  @override
  Widget build(BuildContext context) {
    
    return RawMaterialButton(
      child: Icon(icon),
       elevation: 0.0,
      // disabledElevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0
      ),
      onPressed: onpressed,
    );
  }
}

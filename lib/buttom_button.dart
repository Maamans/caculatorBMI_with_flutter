import 'package:caculator/constant.dart';
import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
      child: Container(
       
       width: double.infinity,
       height: kbottmContainerHeight,
       decoration: BoxDecoration(
         color: kbottomContainerColor,
         borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
         child: Column(
           children: [
             SizedBox(
               height: 15,
             ),
             Text(buttonTitle, style: TextStyle(
               fontWeight: FontWeight.bold, 
               fontSize: 16
             ),)
           ],
         ),
      ),
    );
  }
}

import 'package:caculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:caculator/constant.dart';
import 'package:caculator/buttom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({ required this.bmiResult, required this.resultText, required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CACULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            child: Text('Your Results', style: ktitleTextStyle,),
          )),
          Expanded(
            flex: 5,
            child: ReUsableCard(colour:kactiveCardColour, 
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText.toUpperCase(), style: kresultsTextStyle,),
                Text(bmiResult, style: kBMITextStyle,),
                Text(interpretation, style: kBodyTextStyle,)
              ],
            ), )
      ), ButtomButton(onTap: (){
        Navigator.pop(context);
      }, buttonTitle: 'RE-CACULATE')],
      ),
    );
  }
}
import 'package:caculator/icon_content.dart';
import 'package:caculator/results_page.dart';
import 'package:caculator/reusable_card.dart';
import 'package:caculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:caculator/buttom_button.dart';
import 'package:caculator/round_button.dart';
import 'package:caculator/caculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  
  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  
  
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  // Color maleCardColour = inactiveCardColour;
  //  Color femaleCardColour = inactiveCardColour;

  //  void updateColour (Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour){
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     }else{
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }if(selectedGender == Gender.female){
  //     if (femaleCardColour == inactiveCardColour){
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //     }else{
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  //  }

  

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CACULATOR',), 
      ),
      body: Column(
        children: 
          [Column(
            children: [
             Row(
              children: [
                 Expanded(
                   child: ReUsableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    
                    colour: selectedGender == Gender.male? kactiveCardColour : kinactiveCardColour,
                   ),
                 ),
                  Expanded(
                    child: ReUsableCard(
                      onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                      childCard: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      colour: selectedGender == Gender.female? kactiveCardColour : kinactiveCardColour),
                  ),
               
              ],
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Expanded(
                   child: ReUsableCard(
                    colour: kactiveCardColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: klabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(), style: knumberTextStyle),
                            Text('cm', style: klabelTextStyle,)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0
                            ),overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                              
                            },
                          ),
                        )
                      ],
                    ),
                               ),
                 ),  
              ],

             ), 
              Row(
              children: [
                Expanded(child: ReUsableCard(colour: kactiveCardColour, childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT', style: klabelTextStyle,), 
                    Text(weight.toString(), style: knumberTextStyle,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyRoundActionButton(
                          icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                         MyRoundActionButton(
                          icon: FontAwesomeIcons.minus,
                          onpressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),)), 
                 Expanded(child: ReUsableCard(colour: kactiveCardColour, childCard: Column(
                   children: [
                    Text('AGE', style: klabelTextStyle,), 
                    Text(age.toString(), style: knumberTextStyle,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyRoundActionButton(
                          icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                         MyRoundActionButton(
                          icon: FontAwesomeIcons.minus,
                          onpressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                 ),)),
                
              ],
             ),
             ButtomButton(buttonTitle: 'CACULATE ', onTap: () {
              CaculatorBrain calc = CaculatorBrain(height: height, weight: weight);
       Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
          bmiResult: calc.caculateBMI(),
          resultText: calc.getResults(),
          interpretation: calc.getInterpretation(),
       )));
     },)
            ],
          ),
        ],
      ),
      
    );
  }
}











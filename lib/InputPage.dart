import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resin_calculator/background.dart';
import 'package:resin_calculator/constants.dart';
import 'package:resin_calculator/reusable_card.dart';
import 'package:resin_calculator/results_page.dart';
import 'package:resin_calculator/calculator_brain.dart';
import 'package:resin_calculator/Round_Icon_Button.dart';
import 'responsive.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 25;
  int width = 25;
  int length = 25;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Background(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // padding: isLandscape(context) ? EdgeInsets.symmetric(vertical: 38, horizontal: 42) : EdgeInsets.only(top: 190, right: 80, bottom: 10),
                        width: size.width * 0.5,
                        padding: EdgeInsets.only(top: 190, right: 80, bottom: 10),
                        child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('Height', style: kLabelTextStyle),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    height.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Text(
                                    'cm',
                                    style: kLabelTextStyle,
                                  )
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  inactiveTrackColor: Color(0xFF8D8E98),
                                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                                  overlayColor: Color(0x29EB1555),
                                ),
                                child: Slider (
                                  value: height.toDouble(),
                                  min: 1.0,
                                  max: 50.0,
                                  activeColor: Colors.purple,
                                  onChanged: (double newValue){
                                    setState(() {
                                      height = newValue.round();
                                    }
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Padding(
                          padding: const EdgeInsets.only(top: 10, ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'length',
                                    style:kLabelTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    length.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Text(
                                    'cm',
                                    style: kLabelTextStyle,
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(icon: FontAwesomeIcons.minus,
                                      onPressed: (){
                                        setState(() {
                                          length--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    RoundIconButton(icon: FontAwesomeIcons.plus,
                                      onPressed: (){
                                        setState(() {
                                          length++;
                                        });
                                      },),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'width',
                                  style:kLabelTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  width.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(icon: FontAwesomeIcons.minus,
                                      onPressed: (){
                                        setState(() {
                                          width--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    RoundIconButton(icon: FontAwesomeIcons.plus,
                                      onPressed: (){
                                        setState(() {
                                         width++;
                                        });
                                      },),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200, top: 50),
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.4,
                      height: size.height * 0.1,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text('Calculate',
                            style: TextStyle(
                            fontSize: 20
                          ),
                          ),
                          color: Color(0xff7B1FA2),
                            height: 70,
                            minWidth: 170,
                          onPressed: (){
                            CalculatorBrain calc = CalculatorBrain(length: length, width: width, height: height);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
                                  resinResult: calc.calculateBMI(),

                                )
                            )
                            );
                          }
                        ),
                      )
                    ],

                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
}
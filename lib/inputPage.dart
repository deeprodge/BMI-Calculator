import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardLogo.dart';
import 'resuableCard.dart';
import 'constants.dart';
import 'calculate_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Color male = kinCardColour;
  Color female = kinCardColour;
  Gender currentGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(11, 11, 11, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        colour: currentGender == Gender.male
                            ? kcardColour
                            : kinCardColour,
                        cardChild: cardLogo(FontAwesomeIcons.mars, 'MALE'),
                        onPress: () {
                          setState(() {
                            currentGender = Gender.male;
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: currentGender == Gender.female
                            ? kcardColour
                            : kinCardColour,
                        cardChild: cardLogo(FontAwesomeIcons.venus, 'FEMALE'),
                        onPress: () {
                          setState(() {
                            currentGender = Gender.female;
                          });
                        }),
                  ),
                ],
              )), //Male,Female
              Expanded(
                  child: ReusableCard(
                colour: kcardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: kbbColour,
                          inactiveTrackColor: kIconColor,
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13),
                          overlayColor: Color(0x29F20048),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )), //Slider
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                      colour: kcardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundActionButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                              SizedBox(width: 15),
                              RoundActionButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: ReusableCard(
                      colour: kcardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: klabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundActionButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(width: 15),
                              RoundActionButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ), //Weight, Age
              GestureDetector(
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(height, weight);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CalculatePage(calc.calculateBMI(), calc.getResult(),
                        calc.getInterpretation(), calc.getColor());
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'CALUCULATE YOUR BMI',
                    style: kbbTextStyle,
                  ),
                  margin: EdgeInsets.only(top: 10),
                  height: kbbHeight,
                  width: double.infinity,
                  color: kbbColour,
                ),
              ), //Bottom Bar
            ],
          ),
        ));
  }
}

class RoundActionButton extends StatelessWidget {
  RoundActionButton(this.icon, this.onPressed);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 55.0,
        height: 55.0,
      ),
      shape: CircleBorder(),
    );
  }
}

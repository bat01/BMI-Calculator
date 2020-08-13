import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calc/components/icon_content.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import 'package:bmi_calc/constants.dart';
import 'results_screen.dart';
import 'package:bmi_calc/components/bottom_button.dart';
import 'package:bmi_calc/components/round_icon_button.dart';
import 'package:bmi_calc/calculator_brain.dart';

enum Gender {
  male,
  female,
}

enum SystemOfCalculating { metric, imperial }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  SystemOfCalculating selectedSystem;
  int metricHeight = 180;
  int metricWeight = 75;
  int age = 25;
  double imperialHeight = 5.7;
  int imperialWeight = 165;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      tap: () {
                        setState(() {
                          selectedSystem = SystemOfCalculating.metric;
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'METRIC',
                      ),
                      colour: selectedSystem == SystemOfCalculating.metric
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    tap: () {
                      setState(() {
                        selectedSystem = SystemOfCalculating.imperial;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'IMPERIAL',
                    ),
                    colour: selectedSystem == SystemOfCalculating.imperial
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      tap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    tap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              selectedSystem == SystemOfCalculating.metric
                                  ? metricHeight.toString()
                                  : imperialHeight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              selectedSystem == SystemOfCalculating.metric
                                  ? 'cm'
                                  : 'inch',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8d8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                              value:
                                  selectedSystem == SystemOfCalculating.metric
                                      ? metricHeight.toDouble()
                                      : imperialHeight,
                              min: selectedSystem == SystemOfCalculating.metric
                                  ? 120.0
                                  : 3.92,
                              max: selectedSystem == SystemOfCalculating.metric
                                  ? 220.0
                                  : 7.22,
                              onChanged: (double newValue) {
                                setState(() {
                                  selectedSystem == SystemOfCalculating.metric
                                      ? metricHeight = newValue.round()
                                      : imperialHeight = double.parse(
                                          newValue.toStringAsFixed(1));
                                });
                              }),
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                selectedSystem == SystemOfCalculating.metric
                                    ? metricWeight.toString()
                                    : imperialWeight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                selectedSystem == SystemOfCalculating.metric
                                    ? 'kg'
                                    : 'lbs',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                pressed: () {
                                  setState(() {
                                    selectedSystem == SystemOfCalculating.metric
                                        ? metricWeight--
                                        : imperialWeight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                pressed: () {
                                  setState(() {
                                    selectedSystem == SystemOfCalculating.metric
                                        ? metricWeight++
                                        : imperialWeight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  )),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(
                    metricHeight: metricHeight,
                    metricWeight: metricWeight,
                    imperialWeight: imperialWeight,
                    imperialHeight: imperialHeight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsScreen(
                        bmiResult: selectedSystem == SystemOfCalculating.metric
                            ? calc.calculateMetricBMI()
                            : calc.calculateImperialBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/reusable_buttons_card.dart';
import '../components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                      selected: selectedGender == Gender.male,
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                      selected: selectedGender == Gender.female,
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: kLabelUnSelectedTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(),
                                style: kNumberLabelTextStyle),
                            Text(
                              "cm",
                              style: kLabelUnSelectedTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: kSelectedButtonTextColour,
                            inactiveTrackColor: kUnselectedButtonTextColour,
                            thumbColor: kSliderButtonColour,
                            overlayColor: kSliderOverlayButtonColour,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30.0,
                            ),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kMinHeight,
                            max: kMaxHeight,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kInactiveCardColour,
                      child: ReusableButtonsCard(
                        title: "WEIGHT",
                        amount: weight,
                        increment: () {
                          setState(() {
                            weight++;
                          });
                        },
                        decrement: () {
                          setState(() {
                            if (weight > 2) weight--;
                          });
                        },
                      )),
                  flex: 1,
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    child: ReusableButtonsCard(
                      title: "AGE",
                      amount: age,
                      increment: () {
                        setState(() {
                          age++;
                        });
                      },
                      decrement: () {
                        setState(() {
                          if (age > 1) {
                            age--;
                          }
                        });
                      },
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE YOUR BMI",
            onPress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                    range: calc.getBMIRange(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

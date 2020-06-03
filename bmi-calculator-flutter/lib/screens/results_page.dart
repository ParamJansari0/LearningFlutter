import 'file:///C:/Users/PJ/AndroidStudioProjects/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String range;

  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
    @required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ReusableCard(
                colour: kActiveCardColour,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              resultText.toUpperCase(),
                              style: kResultTextStyle,
                            ),
                            Text(
                              bmiResult,
                              style: kBMITextStyle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              resultText + " BMI Range",
                              style: kBodyLabelTextStyle,
                            ),
                            Text(
                              range,
                              style: kBodyTextStyle,
                            )
                          ],
                        ),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
//                      FlatButton(
//                        onPressed: () {},
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(
//                              vertical: 20.0, horizontal: 20.0),
//                          child: Text(
//                            "SAVE RESULT",
//                            style: kLabelUnSelectedTextStyle,
//                          ),
//                        ),
//                        color: kInactiveCardColour,
//                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              text: "RE-CALCULATE YOUR BMI",
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableButtonsCard extends StatelessWidget {
  final String title;
  final int amount;
  final Function increment;
  final Function decrement;

  ReusableButtonsCard(
      {@required this.title,
      @required this.amount,
      @required this.increment,
      @required this.decrement});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kLabelUnSelectedTextStyle,
        ),
        Text(
          amount.toString(),
          style: kNumberLabelTextStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: decrement,
            ),
            SizedBox(
              width: 20.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: increment,
            ),
          ],
        ),
      ],
    );
  }
}

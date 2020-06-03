import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  IconContent(
      {@required this.icon, @required this.label, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: selected
              ? kSelectedButtonTextColour
              : kUnselectedButtonTextColour,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: selected ? kLabelSelectedTextStyle : kLabelUnSelectedTextStyle,
        ),
      ],
    );
  }
}

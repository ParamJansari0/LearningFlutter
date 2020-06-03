import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi > 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getInterpretation() {
    switch (getResult()) {
      case 'Overweight':
        return 'You have higher than normal weight. Try to exercise more.';
      case 'Normal':
        return 'You have normal weight. Good job!';
      case 'Underweight':
        return 'You have lower than normal weight. You can eat more.';
      default:
        return '';
    }
  }

  String getBMIRange() {
    switch (getResult()) {
      case 'Overweight':
        return 'over 25kg/m2';
      case 'Normal':
        return '18.5 - 25kg/m2';
      case 'Underweight':
        return 'under 18.5 kg/m2';
      default:
        return '';
    }
  }
}

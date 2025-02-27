import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Try to exercise more!';
    } else if (_bmi > 18) {
      return 'Good work, Keep it up!';
    } else {
      return 'Try improving your weight!';
    }
  }
}

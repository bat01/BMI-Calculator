import 'dart:math';
import 'screens/input_page.dart';

class CalculatorBrain {
  final int metricHeight;
  final int metricWeight;
  final int imperialWeight;
  final double imperialHeight;
  double _bmi;

  CalculatorBrain(
      {this.metricHeight,
      this.metricWeight,
      this.imperialWeight,
      this.imperialHeight});

  String calculateMetricBMI() {
    _bmi = metricWeight / pow(metricHeight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String calculateImperialBMI() {
    print(imperialHeight);
    _bmi = 703 *
        imperialWeight /
        pow(imperialHeight.toInt() * 12 + imperialHeight % 10, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal  body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

import 'dart:math';

class CalculatorBrain {
  double? height;
  int? weight;
  late final double? _bmi;
  CalculatorBrain({height = 150, weight = 65}) {
    _bmi = weight / pow(height.round() / 100, 2);
    print(_bmi);
    print(pow(height.round(), 2));
  }

  String bmiCalculate() {
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return "overweight";
      } else if (_bmi! > 18.5) {
        return "normal";
      } else {
        return "underweight";
      }
    } else {
      return "unknown";
    }
  }

  String getInterpresentation() {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return "Bạn béo quá rồi, bạn phải giảm cân đi";
      } else if (_bmi! > 18.5) {
        return "Sức khỏe của bạn ok";
      } else {
        return "Gầy quá, cần phải ăn nhiều vô";
      }
    } else {
      return "unknown";
    }
  }
}

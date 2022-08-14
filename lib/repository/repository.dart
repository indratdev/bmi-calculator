import 'package:bmi_calculator/repository/bmicalculator.dart';

class Repository {
  BMICalculator bmi = BMICalculator();

  Map<ResultResult, dynamic> calculateWithBroca(BMICalculator? value) {
    var valueBroca = bmi.brocaFormula(value!);

    var result = bmi.brocaResult(valueBroca);
    return result;
  }

  Map<ResultBMIFinal, dynamic> calculateWithBMI(BMICalculator? value) {
    var valueBmi = bmi.bmiFormula(value!);
    var result = bmi.bmiResult(valueBmi);
    return result;
  }
}

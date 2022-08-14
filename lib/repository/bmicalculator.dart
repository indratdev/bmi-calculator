import 'package:bmi_calculator/screens/homescreen.dart';
import 'package:flutter/material.dart';

enum ResultBroca { weightIdeal, weightNow, height }

enum ResultResult { result, advice, weightIdeal, weightNow, height }

enum ResultBMIFormula { result, gender }

enum ResultBMIFinal { result, advice, valueBMI }

enum Gender { male, female }

enum Category { kurus, normal, kegemukan, obesitas }

class BMICalculator {
  FormulaBodyWeight formula;
  bool gender;
  int height, age, weight;

  BMICalculator({
    this.formula = FormulaBodyWeight.broca,
    this.gender = true,
    this.age = 1,
    this.height = 0,
    this.weight = 0,
  });

  Map<String, dynamic> brocaFormula(BMICalculator value) {
// Pria: (tinggi badan – 100) – {(tinggi badan – 100) x 10%}
// Wanita: (tinggi badan – 100) – {(tinggi badan – 100) x 15%}
    Map<String, dynamic> resultFormula = {};

    var weight_ideal = 0;
    // kalo pria
    if (value.gender == true) {
      weight_ideal =
          (value.height - 100) - ((value.height - 100) * 0.1).toInt();
    } else {
      weight_ideal =
          ((value.height - 100) - ((value.height - 100) * 0.15)).toInt();
    }
    resultFormula[ResultBroca.weightIdeal.toString()] = weight_ideal;
    resultFormula[ResultBroca.weightNow.toString()] = value.weight;
    resultFormula[ResultBroca.height.toString()] = value.height;

    return resultFormula;
  }

  Map<ResultResult, dynamic> brocaResult(Map<String, dynamic> value) {
    Map<ResultResult, dynamic> resultBroca = {};

    int weightIdeal = value[ResultBroca.weightIdeal.toString()];
    int weightNow = value[ResultBroca.weightNow.toString()];
    int heightNow = value[ResultBroca.height.toString()];

    if (weightNow == weightIdeal) {
      resultBroca[ResultResult.result] = "Berat Kamu Sudah Ideal";
      resultBroca[ResultResult.advice] = "Pertahankan Berat Badan Kamu";
    } else if (weightNow < weightIdeal) {
      resultBroca[ResultResult.result] =
          "Berat Kamu Kurang Ideal, Ayo Tingkatkan Berat Badan Kamu";
      resultBroca[ResultResult.advice] = "Berat Ideal kamu $weightIdeal";
    } else {
      resultBroca[ResultResult.result] =
          "Berat Badan Kamu Terlalu Berlebihan, Ayo Kurangi Berat Badan Kamu";
      resultBroca[ResultResult.advice] = "Berat Badan Ideal kamu  $weightIdeal";
    }

    resultBroca[ResultResult.weightIdeal] = weightIdeal;
    resultBroca[ResultResult.weightNow] = weightNow;
    resultBroca[ResultResult.height] = heightNow;

    return resultBroca;
  }

  Map<ResultBMIFormula, dynamic> bmiFormula(BMICalculator value) {
    // BMI = kg/m2.
    Map<ResultBMIFormula, dynamic> result = {};

    String gender;

    if (value.gender) {
      gender = Gender.male.toString();
    } else {
      gender = Gender.female.toString();
    }

    double weight = value.weight.toDouble();
    double height = value.height.toDouble() / 100;

    double resultWeight = (weight / (height * height));

    result[ResultBMIFormula.result] = resultWeight;
    result[ResultBMIFormula.gender] = gender;

    return result;
  }

  Map<ResultBMIFinal, dynamic> bmiResult(Map<ResultBMIFormula, dynamic> value) {
    var gender = value[ResultBMIFormula.gender];
    double result = value[ResultBMIFormula.result];
    Map<ResultBMIFinal, dynamic> resulFinal = {};

    //kalau lai-laki
    if (gender == Gender.male.toString()) {
      if (result < 18.0) {
        resulFinal[ResultBMIFinal.result] = "Kurus";
        resulFinal[ResultBMIFinal.advice] = [
          "Makanan berkalori tinggi",
          "Makanan dengan kandungan protein, karbohidrat, dan lemak sehat",
          "Hindari camilan yang terlalu gurih atau banyak mengandung msg",
          "Cukupi kebutuhan cairan",
        ];
      } else if (result >= 18.0 && result <= 25.0) {
        resulFinal[ResultBMIFinal.result] = "Normal";
        resulFinal[ResultBMIFinal.advice] = [
          "Pertahankan Berat Badan Kamu Dengan Mengkonsumi Makanan 4 Sehat 5 Sempurna"
        ];
      } else if (result > 25.0 && result <= 27.0) {
        resulFinal[ResultBMIFinal.result] = "Kegemukan";
        resulFinal[ResultBMIFinal.advice] = [
          "Konsumsi sayur dan buah minimal 5 porsi setiap harinya",
          "Membatasi tidur yang berlebihan",
          "Meningkatkan aktivitas fisik minimal 30 menit setiap hari. Lakukan secara teratur 3-5 kali per minggu kemudian lakukan penyesuaian setelah beberapa minggu",
          "Membatasi aktivitas, seperti menonton televisi, bermain komputer dan games",
          "Batasi konsumsi gula, garam, dan lemak berlebih",
        ];
      } else {
        resulFinal[ResultBMIFinal.result] = "Obesitas";
        resulFinal[ResultBMIFinal.advice] = [
          "Konsumsi sayur dan buah minimal 5 porsi setiap harinya",
          "Membatasi tidur yang berlebihan",
          "Meningkatkan aktivitas fisik minimal 30 menit setiap hari. Lakukan secara teratur 3-5 kali per minggu kemudian lakukan penyesuaian setelah beberapa minggu",
          "Membatasi aktivitas, seperti menonton televisi, bermain komputer dan games",
          "Batasi konsumsi gula, garam, dan lemak berlebih",
        ];
      }
    } else {
      // kalau perempuan
      if (result < 17.0) {
        resulFinal[ResultBMIFinal.result] = "Kurus";
        resulFinal[ResultBMIFinal.advice] = [
          "Makanan berkalori tinggi",
          "Makanan dengan kandungan protein, karbohidrat, dan lemak sehat",
          "Hindari camilan yang terlalu gurih atau banyak mengandung msg",
          "Cukupi kebutuhan cairan",
        ];
      } else if (result >= 17.0 && result <= 23.0) {
        resulFinal[ResultBMIFinal.result] = "Normal";
        resulFinal[ResultBMIFinal.advice] = [
          "Pertahankan Berat Badan Kamu Dengan Mengkonsumi Makanan 4 Sehat 5 Sempurna"
        ];
      } else if (result > 23.0 && result <= 27.0) {
        resulFinal[ResultBMIFinal.result] = "Kegemukan";
        resulFinal[ResultBMIFinal.advice] = [
          "Konsumsi sayur dan buah minimal 5 porsi setiap harinya",
          "Membatasi tidur yang berlebihan",
          "Meningkatkan aktivitas fisik minimal 30 menit setiap hari. Lakukan secara teratur 3-5 kali per minggu kemudian lakukan penyesuaian setelah beberapa minggu",
          "Membatasi aktivitas, seperti menonton televisi, bermain komputer dan games",
          "Batasi konsumsi gula, garam, dan lemak berlebih",
        ];
      } else {
        resulFinal[ResultBMIFinal.result] = "Obesitas";
        resulFinal[ResultBMIFinal.advice] = [
          "Konsumsi sayur dan buah minimal 5 porsi setiap harinya",
          "Membatasi tidur yang berlebihan",
          "Meningkatkan aktivitas fisik minimal 30 menit setiap hari. Lakukan secara teratur 3-5 kali per minggu kemudian lakukan penyesuaian setelah beberapa minggu",
          "Membatasi aktivitas, seperti menonton televisi, bermain komputer dan games",
          "Batasi konsumsi gula, garam, dan lemak berlebih",
        ];
      }
    }

    resulFinal[ResultBMIFinal.valueBMI] = result;

    return resulFinal;
  }
}

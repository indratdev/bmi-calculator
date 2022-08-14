import 'package:bmi_calculator/repository/bmicalculator.dart';
import 'package:bmi_calculator/repository/repository.dart';
import 'package:bmi_calculator/screens/resultbmiscreen.dart';
import 'package:bmi_calculator/screens/resultscreen.dart';
import 'package:bmi_calculator/utils/constans.dart';
import 'package:flutter/material.dart';

enum FormulaBodyWeight { broca, bmi }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Repository repo = Repository();
  FormulaBodyWeight _formula = FormulaBodyWeight.broca;
  bool _isMale = true;
  double _height = 150.0;
  int _age = 0;
  int _weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(
        title: const Text(
          Constants.appName,
          style: TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Rumus"),
                        content:
                            Text("Pilihlah rumus hitungan berat dibawah ini "),
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width / 4,
                              ),
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                _formula = FormulaBodyWeight.broca;
                                Navigator.pop(context);
                              });
                            },
                            child: Text("Broca"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _formula = FormulaBodyWeight.bmi;
                                Navigator.pop(context);
                              });
                            },
                            child: Text("BMI"),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width / 4,
                              ),
                              primary: Colors.blue,
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Rumus yang digunakan ",
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: Constants.h3Size,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _formula.toString().split(".").last,
                    style: const TextStyle(
                      fontSize: Constants.h1Size,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMale = true;
                      });
                    },
                    child: Opacity(
                      opacity: (_isMale) ? 1 : 0.3,
                      child: Image.asset(
                        'assets/images/male-icon.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height / 3,
                        width: (_isMale)
                            ? MediaQuery.of(context).size.width / 3
                            : MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMale = false;
                      });
                    },
                    child: Opacity(
                      opacity: (_isMale) ? 0.3 : 1,
                      child: Image.asset(
                        'assets/images/female-icon.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height / 3,
                        width: (_isMale)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // container tinggi
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 6.5,
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                children: <Widget>[
                  const Text(
                    "Tinggi : ",
                    style: TextStyle(
                        fontSize: Constants.h3Size,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _height.toInt().toString(),
                        style: const TextStyle(
                          fontSize: Constants.h1Size,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(" cm"),
                    ],
                  ),
                  Slider.adaptive(
                    activeColor: Colors.black,
                    min: 0.0,
                    max: 300.0,
                    value: _height,
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            // container umur dan berat
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width - 50,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Umur",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.h3Size,
                          ),
                        ),
                        Text(
                          _age.toString(),
                          style: const TextStyle(
                            fontSize: Constants.h1Size,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_age == 0) {
                                    _age = 0;
                                  } else {
                                    _age -= 1;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline,
                                  size: MediaQuery.of(context).size.width / 10),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _age += 1;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                size: MediaQuery.of(context).size.width / 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Berat Badan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Constants.h3Size,
                          ),
                        ),
                        Text(
                          _weight.toString(),
                          style: const TextStyle(
                            fontSize: Constants.h1Size,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_weight == 0) {
                                    _weight = 0;
                                  } else {
                                    _weight -= 1;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                size: MediaQuery.of(context).size.width / 10,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _weight += 1;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                size: MediaQuery.of(context).size.width / 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // end container umur dan berat
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Constants.violetColor,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width / 2,
                      MediaQuery.of(context).size.width / 7,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  var data = BMICalculator(
                    age: _age,
                    formula: _formula,
                    gender: _isMale,
                    height: _height.toInt(),
                    weight: _weight,
                  );

                  if (_formula == FormulaBodyWeight.broca) {
                    var result = repo.calculateWithBroca(data);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultScreen(resultBroca: result),
                    ));
                  } else if (_formula == FormulaBodyWeight.bmi) {
                    var result = repo.calculateWithBMI(data);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultBMIScreen(resultBMI: result),
                    ));
                  }
                },
                child: const Text(
                  "HITUNG",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Constants.h21Size,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

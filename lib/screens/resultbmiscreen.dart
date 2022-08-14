import 'package:bmi_calculator/screens/homescreen.dart';
import 'package:bmi_calculator/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../repository/bmicalculator.dart';

class ResultBMIScreen extends StatefulWidget {
  Map<ResultBMIFinal, dynamic> resultBMI;
  ResultBMIScreen({
    Key? key,
    required this.resultBMI,
  }) : super(key: key);

  @override
  State<ResultBMIScreen> createState() => _ResultBMIScreenState();
}

class _ResultBMIScreenState extends State<ResultBMIScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> _advice = widget.resultBMI[ResultBMIFinal.advice];
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(
          title: const Text("Kembali"),
          centerTitle: false,
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    "Hasil",
                    style: TextStyle(
                      fontSize: Constants.h1Size,
                      fontWeight: FontWeight.bold,
                      color: Constants.violetColor,
                    ),
                  ),
                  const Text(
                    " Perhitungan",
                    style: TextStyle(
                      fontSize: Constants.h2Size,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.violetColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Kamu ",
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: Constants.h3Size,
                          ),
                        ),
                        Text(
                          widget.resultBMI[ResultBMIFinal.result].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.h1Size,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.resultBMI[ResultBMIFinal.valueBMI]
                              .toStringAsFixed(2),
                          style: const TextStyle(
                            color: Constants.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.h1ResultSize,
                          ),
                        ),
                        const Text(
                          "  kg/m2",
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width - 100,
                      child: SfLinearGauge(
                        minimum: 0.0,
                        maximum: 50.0,
                        ranges: const <LinearGaugeRange>[
                          LinearGaugeRange(
                            startValue: 0,
                            endValue: 18.5,
                            color: Colors.blue,
                          ),
                          //Second range
                          LinearGaugeRange(
                            startValue: 18.5,
                            endValue: 22.9,
                            color: Colors.green,
                          ),
                          LinearGaugeRange(
                            startValue: 23,
                            endValue: 24.9,
                            color: Colors.yellow,
                          ),
                          LinearGaugeRange(
                            startValue: 25,
                            endValue: 29.9,
                            color: Colors.orange,
                          ),
                          LinearGaugeRange(
                            startValue: 30,
                            endValue: 50,
                            color: Colors.red,
                          ),
                        ],
                        markerPointers: [
                          LinearShapePointer(
                            value: widget.resultBMI[ResultBMIFinal.valueBMI],
                          ),
                        ],
                        // barPointers: [LinearBarPointer(value: 17)],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.amber,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.6),
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  // height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width - 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Saran : ",
                        style: TextStyle(
                          fontSize: Constants.h1Size,
                          fontWeight: FontWeight.w700,
                          color: Constants.violetColor,
                        ),
                      ),
                      // widget.resultBMI[ResultBMIFinal.advice].toString().map
                      Text(
                        _advice.toString().replaceAll(RegExp('[\\]\\[]'), ''),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: Constants.h21Size,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    // widget.resultBMI = {};
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Constants.violetColor, shadowColor: Colors.grey),
                  child: const Icon(Icons.refresh))
            ],
          ),
        ),
      ),
    );
  }
}

// Jika Anda Memilik tinggi @tinggicm dan berat badan anda kurang dari @berat_ideal
// Berat Kamu Kurang Ideal, Ayo Tingkatkan Berat Badan Kamu
// Berat Ideal kamu 64
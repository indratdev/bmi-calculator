import 'package:bmi_calculator/screens/homescreen.dart';
import 'package:bmi_calculator/utils/constans.dart';
import 'package:flutter/material.dart';

import '../repository/bmicalculator.dart';

class ResultScreen extends StatefulWidget {
  Map<ResultResult, dynamic> resultBroca;
  ResultScreen({
    Key? key,
    required this.resultBroca,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAFB4FF),
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
                      color: Color(0xFF7F5283),
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
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF7F5283),
                  boxShadow: [
                    BoxShadow(
                      // color: Color(0xFF7F5283).withOpacity(0.5),
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 200,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Tinggi Kamu ",
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: Constants.h3Size,
                          ),
                        ),
                        Text(
                          widget.resultBroca[ResultResult.height].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.h1Size,
                          ),
                        ),
                        const Text(
                          "  Cm",
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Berat Badan Kamu ",
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: Constants.h3Size,
                          ),
                        ),
                        Text(
                          "${widget.resultBroca[ResultResult.weightNow]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.h1Size,
                          ),
                        ),
                        const Text(
                          " Kg",
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Text(
                        "${widget.resultBroca[ResultResult.advice]} Kg",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: Constants.h21Size,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.resultBroca[ResultResult.result],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: Constants.h21Size,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    widget.resultBroca = {};
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
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
// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:blood_pressure_app/info_scren.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 49, 153),
        title: const Text('Blood Pressure Monitor',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                SizedBox(
                  width: 450,
                  child: Image.asset(
                    "assets/blood.png",
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(Icons.bookmark_add_rounded,
                            color: Color.fromARGB(255, 29, 207, 224), size: 40),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Systolic(controller: systolicController),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(Icons.bookmark_add_rounded,
                            color: Color.fromARGB(255, 101, 30, 207), size: 40),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Diastolic(controller: diastolicController),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(255, 5, 5, 0.855),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(15.15),
                        ),
                      ),
                      onPressed: () {
                        if (_validateInput(systolicController.text,
                            diastolicController.text)) {
                          int systolic = int.parse(systolicController.text);
                          int diastolic = int.parse(diastolicController.text);
                          if (systolic == 0 || diastolic == 0) {
                            _showInvalidInputPopup(context);
                          } else if (systolic <= 120 && diastolic <= 80) {
                            Get.to(const ResultPage(result: 's1'));
                          } else if (systolic > 120 &&
                              systolic <= 129 &&
                              diastolic <= 80) {
                            Get.to(const ResultPage(result: 's2'));
                          } else if ((systolic >= 130 && systolic <= 139) &&
                              (diastolic > 80 && diastolic <= 89)) {
                            Get.to(const ResultPage(result: 's3'));
                          } else if ((systolic >= 140 && systolic < 180) &&
                              (diastolic >= 90 && diastolic < 120)) {
                            Get.to(const ResultPage(result: 's4'));
                          } else if (systolic >= 180 && diastolic >= 120) {
                            Get.to(const ResultPage(result: 's5'));
                          } else {
                            _showInvalidInputPopup(context);
                          }
                        } else {
                          _showInvalidInputPopup(context);
                        }
                      },
                      icon: const Icon(
                        Icons.health_and_safety_sharp,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      label: const Text(
                        'Show Information',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Created by: Deemantha")],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateInput(String systolic, String diastolic) {
    // Check if both inputs are valid integers
    if (int.tryParse(systolic) == null || int.tryParse(diastolic) == null) {
      return false;
    }
    return true;
  }

  void _showInvalidInputPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Inputs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 164, 0, 0),
              )),
          content: const Text(
              'Please enter valid Numerical values for Requested systolic and diastolic data.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Systolic extends StatelessWidget {
  final TextEditingController controller;

  const Systolic({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '• Systolic pressure',
        ),
      ),
    );
  }
}

class Diastolic extends StatelessWidget {
  final TextEditingController controller;

  const Diastolic({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '• Diastolic pressure',
        ),
      ),
    );
  }
}

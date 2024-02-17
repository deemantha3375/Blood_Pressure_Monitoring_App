// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  final String result;

  const ResultPage({Key? key, required this.result}) : super(key: key);

  String _getResultText(String result) {
    switch (result) {
      case 's1':
        return 'Normal Range';
      case 's2':
        return ' Elevated Range';
      case 's3':
        return 'Hypertension Stage 1';
      case 's4':
        return 'HIGH! Hypertension Stage 2';
      case 's5':
        return 'HIGH! Hypertensive Crisis \nRequires medical attention';
      default:
        return 'Unknown';
    }
  }

  Color _getResultColor(String result) {
    switch (result) {
      case 's1':
        return Colors.green;
      case 's2':
        return Colors.yellow;
      case 's3':
        return const Color.fromARGB(255, 255, 153, 0);
      case 's4':
        return const Color.fromARGB(255, 162, 11, 0);
      case 's5':
        return Colors.deepPurple;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 176, 198),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 49, 153),
        title: const Text(
          'Results of your Blood pressure',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: AutofillHints.telephoneNumberNational,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BloodPressureTable(),
                const SizedBox(height: 20),
                const Text(
                  'Your Blood Pressure Result',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AutofillHints.telephoneNumberNational,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 6, 6, 6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Text(
                    _getResultText(result),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _getResultColor(result),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 221,
                        child: Image.asset(
                          "assets/pressure.jpg",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BloodPressureTable extends StatelessWidget {
  const BloodPressureTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      )),
      color: Color.fromARGB(255, 168, 111, 160),
      shadowColor: const Color.fromARGB(255, 1, 8, 63),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DataTable(
          columnSpacing: 15.0,
          columns: const <DataColumn>[
            DataColumn(
              label: SizedBox(
                width: 100,
                child: Text(
                  'Blood Pressure \nCategory',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 85,
                child: Text(
                  'Systolic \n(mm Hg)',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 85,
                child: Text(
                  'Diastolic \n(mm Hg)',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 85,
                child: Text('Normal ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 255, 65),
                      fontWeight: FontWeight.w800,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('Less than 120',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('Less than 80',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 85,
                child: Text('Elevated',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 230, 2),
                      fontWeight: FontWeight.w800,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('120 – 129',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('Less than 80',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 85,
                child: Text('High BP \n(Stage 1)',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 156, 8, 1),
                      fontWeight: FontWeight.w800,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('130 – 139',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('80 – 89',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 85,
                child: Text('High BP \n(Stage 2)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 175, 31, 20),
                      fontWeight: FontWeight.w800,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('140 or higher',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('90 or higher',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 100,
                child: Text('Hypertensive \ncrisis',
                    style: TextStyle(
                      color: Color.fromARGB(255, 74, 1, 200),
                      fontWeight: FontWeight.w800,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('Higher than 180',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
              DataCell(SizedBox(
                width: 85,
                child: Text('Higher than 120',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    )),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

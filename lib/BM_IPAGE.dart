import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double bmi = 0;
  double _Weight = 0;
  double Height_ = 80;

  late String status = SetStatus(bmi);
  late Color color = getColor(bmi);
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 102, 102),
      ),
      backgroundColor: Color.fromARGB(255, 228, 211, 211),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55, bottom: 20),
                child: Text(
                  'your BMI is :',
                  style: GoogleFonts.oswald(fontSize: 40),
                ),
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: GoogleFonts.oswald(fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 15),
                child: Text(
                  'status: ',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
              Text(
                status,
                style: TextStyle(fontSize: 35, color: color),
              ),
              SizedBox(height: 80),
              Text(
                'Height: $Height_',
                style: GoogleFonts.oswald(fontSize: 40),
              ),
              Slider(
                value: Height_,
                onChanged: (value) {
                  setState(() {
                    Height_ = value;
                  });
                },
                min: 50,
                max: 230,
                divisions: 180,
                label: 'Height"CM"',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Weight: $_Weight',
                  style: GoogleFonts.oswald(fontSize: 40),
                ),
              ),
              SingleChildScrollView(
                child: Slider(
                  value: _Weight,
                  onChanged: (value) {
                    setState(() {
                      _Weight = double.parse(value.toStringAsFixed(2));
                    });
                  },
                  min: 0,
                  max: 150,
                  divisions: 300,
                  label: 'Weight"KG"',
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red.withOpacity(0.75)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))
                      // Colors.red.withOpacity(0.75),

                      ),
                  onPressed: () {
                    setState(() {
                      bmi = (_Weight / (Height_ * Height_ * 0.01 * 0.01));
                      status = SetStatus(bmi);
                      color = getColor(bmi);
                    });
                    // print('elavated clicked');
                  },
                  child: Text(
                    "calculate",
                    style: TextStyle(
                        //backgroundColor: Colors.red.withOpacity(0.75),
                        color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  String SetStatus(double bmi) {
    print('set status is entered with bmi ${bmi}');
    if (bmi == 0) {
      return 'Unknown';
    } else if (bmi < 18) {
      return 'UnderWeight';
    } else if (bmi >= 18 && bmi < 25) {
      return 'Normal';
    } else {
      return 'OverWeight';
    }
  }

  Color getColor(double bmi) {
    print('get color is entered with bmi ${bmi}');
    if (bmi == 0) {
      return Colors.black;
    } else if (bmi >= 18 && bmi < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

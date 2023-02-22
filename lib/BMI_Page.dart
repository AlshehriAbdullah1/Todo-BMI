import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/side_menu.dart';
import 'package:flutter_application_1/todo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/todo.dart';

class _BMI extends StatefulWidget {
  const _BMI({super.key});

  @override
  State<_BMI> createState() => __BMIState();
}

class __BMIState extends State<_BMI> {
  double bmi = 0;
  // ignore: non_constant_identifier_names
  double Height_ = 80;
  // ignore: non_constant_identifier_names
  double _Weight = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffcfdae4),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'your BMI is :',
                style: GoogleFonts.oswald(fontSize: 40),
              ),
              SizedBox(height: 20),
              Text(
                '$bmi',
                style: GoogleFonts.oswald(fontSize: 40),
              ),
              SizedBox(height: 20),
              Text(
                'status: ' + getStatus(bmi),
                style: GoogleFonts.oswald(fontSize: 40, color: getColor(bmi)),
              ),
              SizedBox(height: 80),
              Text(
                'Height: $Height_',
                style: GoogleFonts.oswald(fontSize: 40),
              ),
              SizedBox(width: 30),
              Slider(
                value: Height_,
                onChanged: (value) {
                  setState(() {
                    Height_ = value;
                  });
                },
                min: 0,
                max: 250,
                divisions: 500,
                label: 'Height"KG"',
              ),
              Text(
                'Weight: $_Weight',
                style: GoogleFonts.oswald(fontSize: 40),
              ),
              SizedBox(width: 30),
              SingleChildScrollView(
                child: Slider(
                  value: _Weight,
                  onChanged: (value) {
                    setState(() {
                      _Weight = value;
                    });
                  },
                  min: 0,
                  max: 150,
                  divisions: 300,
                  label: 'Weight"KG"',
                ),
              ),
              InkWell(
                onTap: () => {bmi = _Weight / (Height_ * Height_)},
                child: Container(
                  // color: Colors.blue,
                  width: 180,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.red.withOpacity(0.75),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 10,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Calculate',
                      style: GoogleFonts.robotoMono(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  String getStatus(double bmi) {
    if (bmi == 0) {
      return 'Unknown';
    } else if (bmi < 18) {
      return 'UnderWeight';
    } else if (bmi >= 18 || bmi < 25) {
      return 'Normal';
    } else {
      return 'OverWeight';
    }
  }

  Color getColor(double bmi) {
    if (bmi == 0) {
      return Colors.black;
    } else if (bmi >= 18 && bmi < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

// ignore: camel_case_types
class Sign_in extends StatelessWidget {
  const Sign_in({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWidget(context),
    );
  }
}

Widget myWidget(context) {
  return SafeArea(
    child: Container(
      color: Colors.white70, //Color(0xfff6f6f6),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Icon
              // ignore: prefer_const_constructors
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  width: 180,
                  height: 130,
                  // ignore: unnecessary_new
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://resources.premierleague.com/premierleague/photos/players/250x250/man41668.png'))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Welcome!", style: GoogleFonts.satisfy(fontSize: 40)),

              //enter your email
              SizedBox(
                height: 60,
              ),
              Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    // borderRadius: BorderRadius.circular(80),
                    color: const Color(0x918F8FB3) //Colors.blueGrey,
                    ),
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email')),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    // borderRadius: BorderRadius.circular(80),
                    color: const Color(0x918F8FB3) //Colors.blueGrey,
                    ),
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Password')),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).popAndPushNamed('/Todo'),
                        print("Sign in clicked! ")
                      },
                      child: Container(
                        // color: Colors.blue,
                        width: 90,
                        height: 35,
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
                            'Sign in',
                            style: GoogleFonts.robotoMono(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('don\'t have account? '),
                  InkWell(
                    onTap: () {
                      print('sign up clicked! ');
                    },
                    child: Text(
                      'Sign up here',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )

              //enter your passowrd

              //sign in

              //don't have account ? sign up
            ],
          ),
        ),
      ),
    ),
  );
}

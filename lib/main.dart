import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/mydrawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,  
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      //home: const LoginPage(),

      routes: {
        "/" : (context) =>  LoginPage(),
        MyRoutes.MyHomePage : (context) => MyHomePage(),
        MyRoutes.LoginPage :(context) => LoginPage()
      },
    );
  }
}




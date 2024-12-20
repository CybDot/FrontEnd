// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:velnoteproj/logIn.dart';
//  import 'package:velnoteproj/sideMenu.dart';
import 'package:velnoteproj/homePage.dart';
// import 'package:velnoteproj/practice.dart';
// import 'package:velnoteproj/profile.dart';

void main() {
  runApp(VELNote());
}

class VELNote extends StatelessWidget {
  const VELNote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROJECT VELNote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(
        username: '',
        refreshToken: null,
      ),
    );
  }
}

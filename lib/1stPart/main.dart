// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:velnoteproj/logIn.dart';

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
        home: MyLogIn());
  }
}

// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Welcome, $username!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

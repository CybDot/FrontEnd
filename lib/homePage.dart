// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, library_private_types_in_public_api, avoid_print
//
//  import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:path/path.dart';

import 'package:velnoteproj/sideMenu.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username, required refreshToken});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String username;

  // Define a GlobalKey for the Scaffold to access it anywhere in the widget tree
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    username = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to Scaffold
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF7010C5),
        title: _appbar(username),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
      drawer: Drawer(
        child: Sidemenu(), // Your side menu widget
      ),
    );
  }

  Widget _appbar(String username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome, ${username.isNotEmpty ? username : "Guest"}!',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _bottomNavBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Color(0xFF7010C5),
        ),
        height: 80.0,
      ),
    );
  }
}

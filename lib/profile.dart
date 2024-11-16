// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, library_private_types_in_public_api, avoid_print, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, void_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velnoteproj/logIn.dart';
import 'package:velnoteproj/homePage.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        username: '',
                        refreshToken: null,
                      )),
            );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            'Profile',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.sunny : Icons.stars),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 70.0),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image(
                    image: AssetImage('assets/img/testProfile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hi! VelNote Admin',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: -2,
                  fontFamily: 'chewy',
                  color: const Color.fromARGB(255, 55, 4, 103),
                ),
              ),
            ),
            SizedBox(height: 40),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(height: 40),
            _mainPlatform(
              () {
                print('Edit Account tapped');
              },
              _buttonProperties(_EditAccountButton()),
            ),
            SizedBox(height: 10),
            _mainPlatform(
              () {
                print('Delete Account tapped');
              },
              _buttonProperties(_DeleteAccButton()),
            ),
            SizedBox(height: 10),
            _mainPlatform(
              () {
                print('Help & Support tapped');
              },
              _buttonProperties(_HelpAndSupportButton()),
            ),
            SizedBox(height: 10),
            _mainPlatform(
              () {
                print('Settings tapped');
              },
              _buttonProperties(_SettingsButton()),
            ),
            SizedBox(height: 10),
            _mainPlatform(
              () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogIn()),
                );
              },
              _buttonProperties(_LogOutButton()),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _mainPlatform(VoidCallback work, Widget widget) {
  return GestureDetector(
    onTap: work,
    child: widget,
  );
}

Widget _buttonProperties(dynamic ButtonDetail) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 78, 72, 72).withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ButtonDetail,
  );
}

Widget _EditAccountButton() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Icon(Icons.edit),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
        child: Text(
          'Edit My Account',
          style: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _HelpAndSupportButton() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Icon(Icons.help),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
        child: Text(
          'Help & Support',
          style: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _DeleteAccButton() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Icon(Icons.delete),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
        child: Text(
          'Delete My Account',
          style: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _SettingsButton() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Icon(Icons.settings),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
        child: Text(
          'Settings',
          style: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _LogOutButton() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.all(20),
        child: Icon(Icons.logout_outlined),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
        child: Text(
          'Logout',
          style: GoogleFonts.lora(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    ],
  );
}

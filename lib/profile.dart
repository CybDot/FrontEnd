// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, library_private_types_in_public_api, avoid_print, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers
//
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(10),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Profile',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                fontFamily: 'Chewy-Regular')),
        actions: [
          IconButton(
            icon: Icon(isdark ? Icons.sunny : Icons.stars),
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
                    width: 190,
                    height: 190,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image(
                          image: AssetImage('assets/img/testProfile.jpg')),
                    )),
              ),
            ],
          )),
    );
  }
}

Widget _textFeild(name) {
  return TextField(
    enabled: false,
    decoration: InputDecoration(
      labelText: '$name',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
  );
}

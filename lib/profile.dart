// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, library_private_types_in_public_api, avoid_print, non_constant_identifier_names
//

import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // make a body where user picture and thier details are shown

      appBar: ProfileAppbar(),
    );
  }

  AppBar ProfileAppbar() {
    return AppBar(
      title: Text('Profile'),
      leading: Icon(Icons.menu),
    );
  }
}

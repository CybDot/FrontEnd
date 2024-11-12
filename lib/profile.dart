// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, library_private_types_in_public_api, avoid_print, non_constant_identifier_names, deprecated_member_use
//

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      leading: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/leftArrow.svg',
          height: 20,
          width: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}

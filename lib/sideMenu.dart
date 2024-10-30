// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:velnoteproj/logIn.dart';
import 'package:flutter/material.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        width: 310,
        height: double.infinity,
        color: Color.fromARGB(255, 40, 23, 58),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(119, 72, 212, 244),
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
              ),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              subtitle: Text('Subtitle for test',
                  style: TextStyle(color: Colors.white)),
            ),
            Divider(color: Colors.white54),

            // Navigation Sections
            buildSectionTitle("Home Section"),
            buildAnimatedTile(0, Icons.home, "Home"),

            buildSectionTitle("Your Account"),
            buildAnimatedTile(1, Icons.person, "Your Profile"),
            buildAnimatedTile(2, Icons.settings, "Settings"),
            buildAnimatedTile(2, Icons.logout, "Log Out", onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyLogIn()));
            }),

            buildSectionTitle("Explore"),
            buildAnimatedTile(3, Icons.search, "Search"),
            buildAnimatedTile(4, Icons.create, "Create"),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
      child: Text(
        title,
        style: TextStyle(color: Colors.white54, fontSize: 16),
      ),
    );
  }

  Widget buildAnimatedTile(int index, IconData icon, String title,
      {VoidCallback? onTap}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        if (onTap != null) {
          onTap(); // Executes custom action if provided
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: isSelected ? Colors.purple.withOpacity(0.2) : Colors.transparent,
        child: ListTile(
          leading: AnimatedScale(
            scale: isSelected ? 1.2 : 1.0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

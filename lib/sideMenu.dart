// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously, avoid_print
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velnoteproj/logIn.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  int selectedIndex = -1;

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refresh_token');

    if (refreshToken != null) {
      final url =
          Uri.parse('https://0723-150-107-106-6.ngrok-free.app/api/logout/');
      final response = await http.post(
        url,
        body: jsonEncode({'refresh_token': refreshToken}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 205) {
        await prefs.remove('access_token');
        await prefs.remove('refresh_token');

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyLogIn()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed, please try again.')),
        );
      }
    } else {
      print('No refresh token found.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed, no refresh token found.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        width: 310,
        height: double.infinity,
        color: Color.fromARGB(255, 157, 0, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(119, 52, 175, 202),
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
            buildSectionTitle("Explore"),
            buildAnimatedTile(3, Icons.search, "Search"),
            buildAnimatedTile(4, Icons.create, "Create"),
            buildSectionTitle("Your Account"),
            buildAnimatedTile(1, Icons.person, "Your Profile"),
            buildAnimatedTile(2, Icons.settings, "Settings"),
            buildSectionTitle("Actions"),
            buildAnimatedTile(5, Icons.logout, "Log Out", onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyLogIn()),
              );
            }),
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
        style: TextStyle(
            color: Colors.white54,
            fontSize: 16,
            fontFamily: 'AbrilFatface',
            fontWeight: FontWeight.w600),
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
          onTap();
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: isSelected
            ? const Color.fromARGB(155, 69, 88, 180).withOpacity(0.3)
            : const Color.fromARGB(0, 0, 0, 0),
        child: ListTile(
          leading: AnimatedScale(
            scale: isSelected ? 1.2 : 1.0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

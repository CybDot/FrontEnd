// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String username; // Add the username as a final variable

  // Update constructor to accept the username
  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String username;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    username = widget.username; // Initialize username from widget
    _loadUsername(); // Optionally call this if you still need to load additional data
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Retrieve the token

    if (token != null) {
      // Make the API call to fetch the username
      final url = Uri.parse(
          'https://e180-150-107-106-37.ngrok-free.app/api/home/'); // Replace with your actual API endpoint

      try {
        final response = await http.get(
          url,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          setState(() {
            username = responseData['username'];
            isLoading = false;
          });
        } else {
          setState(() {
            username = 'Error loading username';
            isLoading = false;
          });
        }
      } catch (e) {
        debugPrint('Error: $e');
        setState(() {
          username = 'Error loading username';
          isLoading = false;
        });
      }
    } else {
      setState(() {
        username = 'Guest';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _appbar(username),
      ),
      body:
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
    );
  }

  Widget _appbar(String username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Welcome, $username!'),
      ],
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, avoid_print, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:velnoteproj/logIn.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Mysignup extends StatefulWidget {
  @override
  State<Mysignup> createState() => MysignupState();
}

class MysignupState extends State<Mysignup> {
  // Controllers for the input fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle signup action
  Future<void> _signUp() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse(
            "https://5237-150-107-106-6.ngrok-free.app/api/signup/"), // Replace with your actual signup API URL
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        // Signup success
        print("Signup successful!");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup successful!")),
        );

        // Navigate to the Home Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MyLogIn(), // Pass the username or any data you need
          ),
        );
      } else {
        // Signup failed
        print("Signup failed with status: ${response.statusCode}");
        print("Error: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup failed: ${response.body}")),
        );
      }
    } catch (e) {
      print("An error occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple, // Starting color
              Colors.purpleAccent, // Ending color
            ],
            begin: Alignment.topLeft, // Gradient start point
            end: Alignment.bottomRight, // Gradient end point
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 169.0),
              Center(
                  child: Text('Create Your Account',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 45,
                          fontFamily: 'ChelaOne'))),
              SizedBox(height: 56.0),
              _usernameTextField(),
              SizedBox(height: 24.0),
              _emailTextField(),
              SizedBox(height: 24.0),
              _passwordTextField(),
              _buildloginConnector(),
              SizedBox(height: 24.0),
              _signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(color: Colors.white70, fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 255, 255, 255), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE1BEE7), width: 1.5),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _emailTextField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white70, fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 255, 255, 255), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE1BEE7), width: 1.5),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white70, fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 255, 255, 255), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFFE1BEE7), width: 1.5),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      style: TextStyle(color: Colors.white),
      obscureText: true,
    );
  }

  Widget _signUpButton() {
    return TextButton(
      onPressed: _signUp,
      style: TextButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildloginConnector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Already have an Account?',
              style: TextStyle(color: Colors.white70),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Log in');
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyLogIn()));
              },
              child: Text("Log in",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 249, 251),
                      fontSize: 15)),
            )
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

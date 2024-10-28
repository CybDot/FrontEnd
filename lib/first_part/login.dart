// ignore_for_file: file_names, prefer_const_constructors, unused_element, depend_on_referenced_packages, non_constant_identifier_names, use_build_context_synchronously, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:velnoteproj/first_part/signup.dart';
import 'package:velnoteproj/second_part/homePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  // Login function with API call
  Future<void> login(TextEditingController emailController,
      TextEditingController passwordController) async {
    final url = Uri.parse(
        'https://your-ngrok-url/api/login/'); // Replace with your actual API endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        // Signup success
        print("Signup successful!");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup successful!")),
        );

        // Navigate to the Home Page and pass the username
        var username;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(username: username),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
            image: const AssetImage('assets/login2.jpg'),
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.7), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.book_online,
            size: 1,
            color: Colors.deepPurple,
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
          child: Padding(
            padding: const EdgeInsets.all(27.0),
            child: _buildForm(),
          )),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'ChelaOne',
            fontWeight: FontWeight.w600,
            color: myColor,
          ),
        ),
        const SizedBox(height: 25),
        _emailTextField(),
        const SizedBox(height: 15),
        _passwordTextField(),
        const SizedBox(height: 15),
        _buildRememberForget(),
        _buildSignUpConnector(),
        const SizedBox(height: 15),
        _buildLogInButton(),
        const SizedBox(height: 15),
        _buildOtherLogin()
      ],
    );
  }

  Widget _emailTextField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
            color: Color.fromARGB(255, 108, 5, 142), fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 169, 23, 247), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
          color: const Color.fromARGB(255, 56, 2, 92), fontFamily: 'Abrilfat'),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
            color: const Color.fromARGB(255, 108, 5, 142),
            fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 169, 23, 247), width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      obscureText: true,
      style: TextStyle(
          color: Color.fromARGB(255, 56, 2, 92), fontFamily: 'Abrilfat'),
    );
  }

  Widget _buildRememberForget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            debugPrint('Forgot Password');
          },
          child: Text(
            'Forgot Your Password?',
            style: TextStyle(color: Color.fromARGB(128, 41, 39, 39)),
          ),
        )
      ],
    );
  }

  Widget _buildLogInButton() {
    return TextButton(
      onPressed: () {
        login(emailController, passwordController);
      },
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.deepPurple,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSignUpConnector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Don\'t Have an Account?',
          style: TextStyle(color: Color.fromARGB(128, 41, 39, 39)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Mysignup()));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(164, 132, 19, 197)),
          ),
        ),
      ],
    );
  }

  Widget _buildOtherLogin() {
    return Center(
        child: Column(
      children: [
        Text('or Login With', style: TextStyle(color: Colors.grey)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google),
          ],
        )
      ],
    ));
  }
}

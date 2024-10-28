// ignore_for_file: file_names, prefer_const_constructors, unused_element, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:velnoteproj/first_part/signup.dart';

class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  Future<void> login(
      dynamic emailController, dynamic passwordController) async {
    final url = Uri.parse(
        'https://4811-150-107-106-22.ngrok-free.app/api/login/'); // Replace with your API endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming the API sends a token or user data in response
        final data = jsonDecode(response.body);
        debugPrint('Login Successful: $data');
        // Navigate to another screen or store the token for future requests
      } else {
        debugPrint('Login Failed: ${response.body}');
        // Handle unsuccessful login attempt (e.g., display an error message)
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  late Color myColor;
  late Size mediaSize;
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
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
            Positioned(bottom: 0, child: _bulidButtom()),
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

  Widget _bulidButtom() {
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
            child: _bulidForm(),
          )),
    );
  }

  Widget _bulidForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' Welcome Back',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'ChelaOne',
            fontWeight: FontWeight.w600,
            color: myColor,
          ),
        ),

        const SizedBox(height: 25),

        //email
        _EmailTextFeild(),
        const SizedBox(height: 15),

        //password
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

  Widget _makeGreyText(String text, TextStyle textStyle) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(164, 132, 19, 197),
      ),
    );
  }

  Widget _makeLIghtText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(128, 41, 39, 39),
      ),
    );
  }

  Widget _EmailTextFeild() {
    return TextField(
      controller: emailCotroller,
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 236, 129, 255), width: 1.5),
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
        controller: passwordCotroller,
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(255, 236, 129, 255), width: 1.5),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        style: TextStyle(
            color: Color.fromARGB(255, 56, 2, 92), fontFamily: 'Abrilfat'));
  }

  Widget _buildRememberForget() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Icon(
          // make icon grey
          color: Colors.grey,
          size: 25,
          Icons.lock,
        ),
        TextButton(
          onPressed: () {
            debugPrint('Forgot Password');
          },
          child: _makeLIghtText('Forgot Your Password?'),
        )
      ])
    ]);
  }

  Widget _buildLogInButton() {
    return TextButton(
      onPressed: () {
        login(emailCotroller, passwordCotroller);
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

  Widget _buildOtherLogin() {
    return Center(
        child: Column(
      children: [
        _makeGreyText('or Login With', TextStyle(fontSize: 15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Tab(icon: Image.asset('assets/google.png'))],
        )
      ],
    ));
  }

  Widget _buildSignUpConnector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _makeLIghtText('Dont Have an Account?'),
            TextButton(
              onPressed: () {
                debugPrint('Sign Up');

                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Mysignup()));
              },
              child: _makeGreyText("Sign Up", TextStyle(fontSize: 25)),
            )
          ],
        )
      ],
    );
  }
}

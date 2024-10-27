// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class Mysignup extends StatefulWidget {
  @override
  State<Mysignup> createState() => MysignupState();
}

class MysignupState extends State<Mysignup> {
  // Controllers for the input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle signup action
  void _signUp() {
    // You can add your sign-up logic here
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    print("Name: $name, Email: $email, Password: $password");
    // Perform signup action or call your signup function here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _fristAndLastName(),
          SizedBox(height: 24.0),
          _nameTExtfeild(),
          SizedBox(height: 24.0),
          _EmailTExtfeild(),
          SizedBox(height: 24.0),
          _passwordTExtfeild(),
          SizedBox(height: 24.0),
          _SignupButton()
        ]),
      ),
    );
  }

  Widget _fristAndLastName() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0), // Make edges circular
            ),
          ),
        ),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Last Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0), // Make edges circular
            ),
          ),
        ),
      ])
    ]);
  }

  // Name Field
  Widget _nameTExtfeild() {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Make edges circular
        ),
      ),
    );

    // Email Field
  }

  Widget _EmailTExtfeild() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Make edges circular
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  // Password Field
  Widget _passwordTExtfeild() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Make edges circular
        ),
      ),
      obscureText: true,
    );
  }

  // Sign Up Button
  Widget _SignupButton() {
    return TextButton(
      onPressed: _signUp,
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple, // Background color
        foregroundColor: Colors.white, // Text color
        padding: EdgeInsets.symmetric(horizontal: 32.0),
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

  @override
  void dispose() {
    // Dispose controllers to free up memory
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

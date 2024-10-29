// ignore_for_file: file_names, prefer_const_constructors, unused_element, depend_on_referenced_packages, non_constant_identifier_names, use_build_context_synchronously, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables
// ignore_for_file: file_names;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velnoteproj/signup.dart'; // Importing the sign-up page
import 'package:velnoteproj/homePage.dart'; // Importing the home page after successful login
import 'package:http/http.dart' as http; // Importing HTTP package for API calls
import 'dart:convert'; // Importing dart:convert for JSON encoding/decoding
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importing Font Awesome icons
// Importing Shared Preferences for local storage

class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  // Controllers for email and password text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser =
      false; // For "Remember Me" functionality (not implemented)

  // Login function that makes an API call to authenticate the user
  Future<void> login(TextEditingController emailController,
      TextEditingController passwordController) async {
    // Define the API endpoint for login
    final url = Uri.parse(
        'https://e180-150-107-106-37.ngrok-free.app/api/login/'); // Replace with your actual API endpoint

    try {
      // Send a POST request to the API
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json'
        }, // Set content type to JSON
        body: jsonEncode({
          'email': emailController.text, // Send email from the text field
          'password':
              passwordController.text, // Send password from the text field
        }),
      );

      // Check if the response status is OK (200)
      if (response.statusCode == 200) {
        // Decode response body to get the access token and username
        final responseData = json.decode(response.body);
        final token = responseData['access']; // Access token
        final username = responseData['username']; // Username

        // Save the token and username using SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('username', username);

        // Navigate to the Home Page and pass the username
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomePage(username: username), // Pass username to the home page
          ),
        );
      } else {
        // Error handling for unsuccessful login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Login failed. Please check your credentials.")),
        );
      }
    } catch (e) {
      // Catch any errors that occur during the API call
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred. Please try again later.")),
      );
    }
  }

  late Color myColor; // To hold the primary color from the theme
  late Size mediaSize; // To hold the size of the media

  @override
  Widget build(BuildContext context) {
    myColor =
        Theme.of(context).primaryColor; // Get the primary color from the theme
    mediaSize = MediaQuery.of(context).size; // Get the size of the media
    return Container(
      // Background container for the login screen
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage('assets/login2.jpg'), // Background image
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.7), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Make scaffold background transparent
        body: Stack(
          children: [
            Positioned(
                top: 80, child: _buildTop()), // Top section of the login screen
            Positioned(
                bottom: 0,
                child: _buildBottom()), // Bottom section of the login screen
          ],
        ),
      ),
    );
  }

  // Widget to build the top section of the login screen
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.book_online, // Icon at the top
            size: 1,
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }

  // Widget to build the bottom section of the login screen
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), // Rounded top left corner
            topRight: Radius.circular(25), // Rounded top right corner
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: _buildForm(), // Call the function to build the login form
        ),
      ),
    );
  }

  // Widget for the email text field
  Widget _emailTextField() {
    return TextField(
      controller: emailController, // Controller to get the input value
      decoration: InputDecoration(
        labelText: 'Email', // Label for the text field
        labelStyle: TextStyle(
            color: Color.fromARGB(255, 108, 5, 142), fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 169, 23, 247),
              width: 2.0), // Border when focused
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress, // Set keyboard type to email
      style: TextStyle(
          color: const Color.fromARGB(255, 56, 2, 92), fontFamily: 'Abrilfat'),
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

  // Widget for the password text field
  Widget _passwordTextField() {
    return TextField(
      controller: passwordController, // Controller to get the input value
      decoration: InputDecoration(
        labelText: 'Password', // Label for the text field
        labelStyle: TextStyle(
            color: const Color.fromARGB(255, 108, 5, 142),
            fontFamily: 'Abrilfat'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 169, 23, 247),
              width: 2.0), // Border when focused
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      obscureText: true, // Hide the password text
      style: TextStyle(
          color: Color.fromARGB(255, 56, 2, 92), fontFamily: 'Abrilfat'),
    );
  }

  // Widget for the "Remember Me" and "Forgot Password" section
  Widget _buildRememberForget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            debugPrint('Forgot Password'); // Action for "Forgot Password"
          },
          child: Text(
            'Forgot Your Password?',
            style: TextStyle(color: Color.fromARGB(128, 41, 39, 39)),
          ),
        )
      ],
    );
  }

  Widget _buildSignUpConnector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(
            '  Don\'t Have an Account?',
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
        ]),
      ],
    );
  }

  // Widget for the login button
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

  // Widget for the sign-up button
  Widget _buildSignUpButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Mysignup()),
        );
      },
      child: Text(
        "Sign Up",
        style:
            TextStyle(fontSize: 15, color: Color.fromARGB(164, 132, 19, 197)),
      ),
    );
  }

  // Widget for alternative login methods
  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          Text('or Login With', style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.google), // Google login icon
            ],
          )
        ],
      ),
    );
  }
}

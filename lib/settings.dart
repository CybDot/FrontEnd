// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Setting 1'),
            Text('Setting 2'),
            Text('Setting 3'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your code here to handle the save button click
        },
        tooltip: 'Save',
        child: Icon(Icons.save),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure it takes minimal height
              children: [
                Text('Bottom Sheet Content'),
                Text('Another Setting'),
                Text('Yet Another Setting'),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting 1'),
              onTap: () {
                // Handle navigation or actions here
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Setting 2'),
              onTap: () {
                // Handle navigation or actions here
              },
            ),
          ],
        ),
      ),
    );
  }
}

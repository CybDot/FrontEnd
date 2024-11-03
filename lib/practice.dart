// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnimationPractice extends StatefulWidget {
  const AnimationPractice({super.key});

  @override
  State<AnimationPractice> createState() => _AnimationPracticeState();
}

class _AnimationPracticeState extends State<AnimationPractice> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 900),
          width: isExpanded ? 200.0 : 80.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: isExpanded ? Colors.green : Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(isExpanded ? Icons.check : Icons.shopping_cart_outlined,
                  color: Colors.white),
              if (isExpanded)
                Text('Added to cart',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))
            ],
          )),
    )));
  }
}

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, override_on_non_overriding_member, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

class AnimationPractice extends StatefulWidget {
  @override
  State<AnimationPractice> createState() => _AnimationPracticeState();
}

class _AnimationPracticeState extends State<AnimationPractice>
    with SingleTickerProviderStateMixin {
  late Animation<double> fadeInTransition;
  late AnimationController controller;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    fadeInTransition = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
          child: FadeTransition(
            opacity: fadeInTransition,
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
                  Icon(
                    isExpanded ? Icons.check : Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  if (isExpanded)
                    Text(
                      'Added to cart',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

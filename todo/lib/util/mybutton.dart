// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  Mybutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Set the border radius here
      ),
      color: const Color.fromARGB(31, 158, 158, 158),
      child: Text(
        text,
        style: const TextStyle( fontSize: 15, color: Colors.white),
      ),
    );
  }
}

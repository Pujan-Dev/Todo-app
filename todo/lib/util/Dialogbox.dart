// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo/util/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback oncancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.oncancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(230, 30, 31, 31),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  hintText: "Add new task",
                  hintStyle: TextStyle(color: Colors.white54),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mybutton(
                  text: "Save",
                  onPressed: onSave,
                ),
                Mybutton(
                  text: "Cancel",
                  onPressed: oncancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

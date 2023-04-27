import 'dart:ui';

import 'package:flutter/material.dart';

import '../color/colors.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final controller2;
  VoidCallback onSave;
  VoidCallback onCancel;
  VoidCallback onUpdate;

    DialogBox({super.key,
      required this.controller,
      required this.controller2,
      required this.onSave,
      required this.onCancel,
      required this.onUpdate,

  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),

      content: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blueGrey,
            Colors.blue,
          ]),
        ),
        height: 190,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Colors.white,
              ),
              child: TextField(
                cursorColor: Colors.black87,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    contentPadding: EdgeInsets.all(10.0)
                ),
              ),
            ),
            Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(100.0),
               color: Colors.white,
              ),
              child: TextField(
                cursorColor: Colors.black87,
                controller: controller2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Description",
                    contentPadding: EdgeInsets.all(10.0)
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8),

                MyButton(text: "cancel", onPressed: onCancel),
                const SizedBox(width: 8),

                MyButton(text: "update", onPressed: onUpdate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

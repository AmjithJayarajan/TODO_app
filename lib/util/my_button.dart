
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      onPressed: onPressed,
      color: mycomb1,
      child: Text(text),
    );
  }
}
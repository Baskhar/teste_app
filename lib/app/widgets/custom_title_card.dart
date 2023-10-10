import 'package:flutter/material.dart';

class CustomTitleCardTextField extends StatelessWidget {
  final String text;
  // final int fontSize;
  // //final int fontSize;
  const CustomTitleCardTextField({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

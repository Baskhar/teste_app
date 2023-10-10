// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomContainerHorario extends StatelessWidget {
  final String text;
  const CustomContainerHorario({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(text),
          )),
    );
  }
}

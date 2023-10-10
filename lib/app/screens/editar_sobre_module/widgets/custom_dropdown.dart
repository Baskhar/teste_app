import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  CustomDropdownButton({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Expanded(
        child: DropdownButton<String>(
          value: widget.value,
          onChanged: widget.onChanged,
          underline: Container(),
          items: widget.items
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(value),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

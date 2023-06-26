
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.filled,
        required this.radius,
        required this.hint,
        required this.inputType,
        required this.autoFocus,
        required this.hideDigit});

  final bool autoFocus;
  final bool hideDigit;
  final bool filled;
  final double radius;
  final String hint;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      obscureText: hideDigit,
      keyboardType: inputType,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          hintText: hint,
          filled: filled,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius))),
    );
  }
}
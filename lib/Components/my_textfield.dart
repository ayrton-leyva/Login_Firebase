import 'dart:ffi';

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  late TextEditingController controller;
  late String hintText;
  late bool obscureText;
  late MaterialColor materialColor;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.materialColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: materialColor[500]),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: materialColor.shade400,
            ),
          ),
          fillColor: materialColor.shade200,
          filled: true,
        ),
      ),
    );
  }
}

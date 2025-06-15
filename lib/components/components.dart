import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller; // Specify the type for better clarity
  final String hintText;
  final bool obscureText;
  final double width;
  final bool readOnly; // Add readOnly as a parameter

  const MyTextField({
    super.key,
    this.controller,
    required this.readOnly,
    required this.hintText,
    required this.obscureText,
    required this.width, // Include width in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Set the width of the container
      child: TextField(
        controller: controller, // Set the controller
        obscureText: obscureText, // Set the obscureText property
        readOnly: readOnly, // Set the readOnly property
        decoration: InputDecoration(
          fillColor: const Color(0xffFFE2E3),
          filled: true, // Ensure the fill color is applied
          hintText: hintText, // Set the hint text
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffFF4C5B),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffFF4C5B),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class BloodGroupDropdown extends StatefulWidget {
  @override
  _BloodGroupDropdownState createState() => _BloodGroupDropdownState();
}

class _BloodGroupDropdownState extends State<BloodGroupDropdown> {
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGroup,
      hint: Text("Select"),
      items: bloodGroups.map((String group) {
        return DropdownMenuItem<String>(
          value: group,
          child: Text(group),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedGroup = newValue;
        });
      },
      decoration: InputDecoration(
        fillColor: const Color(0xffFFE2E3),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: BorderSide(color: Color(0xff2D2D2D), width: 2),
        ),
      ),
    );
  }
}
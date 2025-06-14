import 'package:flutter/material.dart';
import 'package:organconnect_app/components/components.dart';
import 'package:organconnect_app/status_page.dart';
import 'components/bloodgroup_component.dart';

class DonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFDF5),
        appBar: AppBar(
          title: Text(
            "Donor Registration",
            style: TextStyle(color: Color(0xffFFFDF5)),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff682228),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                _buildTextFieldLabel("Enter Your Name", screenWidth),
                _buildTextField(screenWidth, "Name"),
                SizedBox(height: 12),
                _buildAgeAndBloodGroup(screenWidth),
                SizedBox(height: 12),
                _buildTextFieldLabel("Organ to Donate", screenWidth),
                _buildTextField(screenWidth, "Organ"),
                SizedBox(height: 12),
                _buildTextFieldLabel("Disease (if no, write NA)", screenWidth),
                _buildTextField(screenWidth, "Disease"),
                SizedBox(height: 12),
                _buildTextFieldLabel("Live Location", screenWidth),
                _buildTextField(screenWidth, "Location"),
                SizedBox(height: 15),
                _buildSubmitButton(context, screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldLabel(String label, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        label,
        style: TextStyle(fontSize: screenWidth * 0.04),
      ),
    );
  }

  Widget _buildTextField(double screenWidth, String hintText) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.9,
        child: MyTextField(hintText: hintText, obscureText: false, width: screenWidth * 0.9),
      ),
    );
  }

  Widget _buildAgeAndBloodGroup(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTextFieldLabel("Enter Your Age", screenWidth),
              SizedBox(height: 8),
              _buildTextField(screenWidth, "Age"),
            ],
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        Expanded(
          child: Column(
            children: [
              _buildTextFieldLabel("Blood Group", screenWidth),
              SizedBox(height: 8),
              BloodGroupDropdown(), // Use the BloodGroupDropdown widget here
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StatusPage()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(170, 60),
          backgroundColor: Color(0xffFF4C5B),
        ),
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
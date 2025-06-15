import 'package:flutter/material.dart';
import 'package:organconnect_app/components/components.dart';
import 'package:organconnect_app/components/user_session_info.dart';
import 'package:organconnect_app/donor_dashboard.dart';
import 'components/bloodgroup_component.dart';

class DonorProfilePage extends StatefulWidget {
  @override
  _DonorProfilePageState createState() => _DonorProfilePageState();
}

class _DonorProfilePageState extends State<DonorProfilePage> {
  final TextEditingController newAge = TextEditingController();
  final TextEditingController newOrgan = TextEditingController();
  final TextEditingController newDisease = TextEditingController();
  final TextEditingController newLocation = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current UserSession data
    newAge.text = UserSession.getAge() ?? '';
    newOrgan.text = UserSession.getOrgan() ?? '';
    newDisease.text = UserSession.getDisease() ?? '';
    newLocation.text = UserSession.getLocation() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xffFF4C5B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal Information', style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color(0xffFF4C5B))),
            SizedBox(height: screenHeight * 0.02),
            _buildLabel('Name', screenWidth),
            MyTextField(hintText: 'Name', obscureText: false, width: screenWidth * 0.9, controller: TextEditingController(text: UserSession.getName()), readOnly: true),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Email', screenWidth),
            MyTextField(hintText: 'Email', obscureText: false, width: screenWidth * 0.9, controller: TextEditingController(text: UserSession.getEmail()), readOnly: true),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Age', screenWidth),
            MyTextField(hintText: 'Age', obscureText: false, width: screenWidth * 0.9, controller: newAge, readOnly: false),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Blood Group', screenWidth),
            BloodGroupDropdown(),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Organ Donated', screenWidth),
            MyTextField(hintText: 'Organ', obscureText: false, width: screenWidth * 0.9, readOnly: false, controller: newOrgan),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Disease (If any)', screenWidth),
            MyTextField(hintText: 'Disease', obscureText: false, width: screenWidth * 0.9, readOnly: false, controller: newDisease),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Live Location', screenWidth),
            MyTextField(hintText: 'Location', obscureText: false, width: screenWidth * 0.9, readOnly: false, controller: newLocation),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (newAge.text.isEmpty || newOrgan.text.isEmpty || newDisease.text.isEmpty || newLocation.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Fill all the blanks!"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    // Update UserSession with new values
                    UserSession.setAge(newAge.text);
                    UserSession.setOrgan(newOrgan.text);
                    UserSession.setDisease(newDisease.text);
                    UserSession.setLocation(newLocation.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Details updated successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Optionally, you can navigate back to the previous page
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DonorDashboard()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                  backgroundColor: Color(0xffFF4C5B),
                ),
                child: Text('Update Profile', style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4),
      child: Text(label, style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, color: Color(0xff2D2D2D))),
    );
  }
}
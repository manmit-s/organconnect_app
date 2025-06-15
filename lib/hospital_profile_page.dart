import 'package:flutter/material.dart';
import 'package:organconnect_app/components/components.dart';
import 'package:organconnect_app/components/user_session_info.dart';
import 'package:organconnect_app/hospital_dashboard.dart';
import 'components/bloodgroup_component.dart';

class HospitalProfilePage extends StatefulWidget {
  @override
  _HospitalProfilePageState createState() => _HospitalProfilePageState();
}

class _HospitalProfilePageState extends State<HospitalProfilePage> {
  final TextEditingController newOrganController = TextEditingController(text: UserSession.getOrgan());

  @override
  void dispose() {
    newOrganController.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Profile', style: TextStyle(color: Colors.white)),
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
            Text('Hospital Information', style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color(0xffFF4C5B))),
            SizedBox(height: screenHeight * 0.02),
            _buildLabel("Hospital's Name", screenWidth),
            MyTextField(
              hintText: 'Hospital Name',
              obscureText: false,
              width: screenWidth * 0.9,
              readOnly: true,
              controller: TextEditingController(text: UserSession.getName()),
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel("Affiliation Code", screenWidth),
            MyTextField(
              hintText: 'Affiliation Code',
              obscureText: false,
              width: screenWidth * 0.9,
              readOnly: true,
              controller: TextEditingController(text: UserSession.getAffiliationCode()),
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Organ Availability', screenWidth),
            MyTextField(
              hintText: 'Organs Available',
              obscureText: false,
              width: screenWidth * 0.9,
              readOnly: false,
              controller: newOrganController,
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Blood Groups Accepted', screenWidth),
            BloodGroupDropdown(),
            SizedBox(height: screenHeight * 0.015),
            _buildLabel('Hospital Location', screenWidth),
            MyTextField(
              hintText: 'Location',
              obscureText: false,
              width: screenWidth * 0.9,
              readOnly: true,
              controller: TextEditingController(text: UserSession.getLocation()),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (newOrganController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Fill all the blanks!"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    // Update UserSession with new values
                    UserSession.setOrgan(newOrganController.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Details updated successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Navigate back to the Hospital Dashboard
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HospitalDashboard()));
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
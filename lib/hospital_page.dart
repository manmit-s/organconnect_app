import 'package:flutter/material.dart';
import 'package:organconnect_app/components/components.dart';
import 'package:organconnect_app/components/user_session_info.dart';
import 'package:organconnect_app/hospital_dashboard.dart';
import 'components/bloodgroup_component.dart';

class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  bool _wantsToReceiveBlood = false; // State variable for the toggle switch

  // Controllers for each text field
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController affiliationCodeController = TextEditingController();
  final TextEditingController organController = TextEditingController();
  final TextEditingController diseaseController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFDF5),
      appBar: AppBar(
        title: Text(
          "Hospital Registration",
          style: TextStyle(color: Color(0xffFFFDF5)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFF4C5B),
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
              _buildTextFieldLabel("Hospital's Name", screenWidth),
              _buildTextField(screenWidth, "Hospital Name", hospitalNameController),
              SizedBox(height: 12),
              _buildAffiliationAndBloodGroup(screenWidth),
              SizedBox(height: 12),
              _buildTextFieldLabel("Organ to Receive", screenWidth),
              _buildTextField(screenWidth, "Organ", organController),
              SizedBox(height: 12),
              _buildTextFieldLabel("Disease (if no, write NA)", screenWidth),
              _buildTextField(screenWidth, "Disease", diseaseController),
              SizedBox(height: 12),
              _buildTextFieldLabel("Live Location", screenWidth),
              _buildTextField(screenWidth, "Location", locationController),
              SizedBox(height: 12),
              _buildBloodDonationToggle(screenWidth), // Add the toggle switch here
              SizedBox(height: 15),
              _buildSubmitButton(context, screenWidth),
            ],
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

  Widget _buildTextField(double screenWidth, String hintText, TextEditingController controller) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.9,
        child: MyTextField(
          hintText: hintText,
          obscureText: false,
          width: screenWidth * 0.9,
          readOnly: false,
          controller: controller, // Pass the specific controller here
        ),
      ),
    );
  }

  Widget _buildAffiliationAndBloodGroup(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTextFieldLabel("Affiliation Code", screenWidth),
              SizedBox(height: 8),
              _buildTextField(screenWidth, "Code", affiliationCodeController), // Use the affiliation code controller
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

  Widget _buildBloodDonationToggle(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Willing to Receive Blood?",
          style: TextStyle(fontSize: screenWidth * 0.04),
        ),
        Switch(
          value: _wantsToReceiveBlood,
          onChanged: (value) {
            setState(() {
              _wantsToReceiveBlood = value; // Update the state
            });
          },
          activeColor: Color(0xffFF4C5B), // Customize the active color
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.5),
      child: ElevatedButton(
        onPressed: () {
          String hospitalName = hospitalNameController.text;
          String affiliationCode = affiliationCodeController.text;
          String organ = organController.text;
          String disease = diseaseController.text;
          String location = locationController.text;

          if(hospitalName.isEmpty || affiliationCode.isEmpty || organ.isEmpty || disease.isEmpty || location.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please fill all the blanks!"),
                backgroundColor: Colors.redAccent,
              ),);
          }
          else{
            UserSession.setName(hospitalName);
            UserSession.setAffiliationCode(affiliationCode);
            UserSession.setOrgan(organ);
            UserSession.setDisease(disease);
            UserSession.setLocation(location);

            Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDashboard()));
          }

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
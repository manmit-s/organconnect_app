import 'package:flutter/material.dart';
import 'package:organconnect_app/components/components.dart';
import 'package:organconnect_app/components/user_session_info.dart';
import 'package:organconnect_app/donor_dashboard.dart';
import 'components/bloodgroup_component.dart';

class DonorPage extends StatefulWidget {
  @override
  _DonorPageState createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  bool _wantsToDonateBlood = false; // State variable for the toggle switch

  // Controllers for each text field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
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
          "Donor Registration",
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
              _buildTextFieldLabel("Enter Your Name", screenWidth),
              _buildTextField(screenWidth, "Name", nameController),
              SizedBox(height: 12),
              _buildAgeAndBloodGroup(screenWidth),
              SizedBox(height: 12),
              _buildTextFieldLabel("Organ to Donate", screenWidth),
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

  Widget _buildAgeAndBloodGroup(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTextFieldLabel("Enter Your Age", screenWidth),
              SizedBox(height: 8),
              _buildTextField(screenWidth, "Age", ageController), // Use the age controller
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
          "Willing to Donate Blood?",
          style: TextStyle(fontSize: screenWidth * 0.04),
        ),
        Switch(
          value: _wantsToDonateBlood,
          onChanged: (value) {
            setState(() {
              _wantsToDonateBlood = value; // Update the state
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
          String name = nameController.text;
          String age = ageController.text;
          String organ = organController.text;
          String disease = diseaseController.text;
          String location = locationController.text;

          //save these values
          if(name.isEmpty || age.isEmpty || organ.isEmpty || disease.isEmpty || location.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please fill all the blanks!"),
                backgroundColor: Colors.redAccent,
              ),);
          }
          else{
            UserSession.setName(name);
            UserSession.setAge(age);
            UserSession.setOrgan(organ);
            UserSession.setDisease(disease);
            UserSession.setLocation(location);

            Navigator.push(context, MaterialPageRoute(builder: (context) => DonorDashboard()));
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
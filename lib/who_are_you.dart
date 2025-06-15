import "package:flutter/material.dart";
import "package:organconnect_app/donor_page.dart";
import "package:organconnect_app/hospital_page.dart";
import "package:organconnect_app/styles.dart";

class WhoAreYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: const Color(0xffFFFDF5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 130),
              Text(
                "Who Are You?",
                style: title),
              SizedBox(height: 80),
              _buildRoleButton(context, "I'm a Donor", "assets/images/person.png", DonorPage()),
              SizedBox(height: 40),
              _buildRoleButton(context, "I'm a Hospital", "assets/images/hospital.png", HospitalPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title, String imagePath, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0xffFF4C5B), width: 4),
          color: Color(0xffffeced),
        ),
        width: 300,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xffFF4C5B)),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: Color(0xffFF4C5B), size: 50),
          ],
        ),
      ),
    );
  }
}
import "package:flutter/material.dart";
import "package:organconnect_app/donor_dashboard.dart";
import "package:organconnect_app/hospital_dashboard.dart";
import "login_page.dart";// Import the new login page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: HospitalDashboard(), // Use the LoginPage widget as the home
    );
  }
}
import "package:flutter/material.dart";
import "package:organconnect_app/who_are_you.dart";
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
      home: WhoAreYou(), // Use the LoginPage widget as the home
    );
  }
}
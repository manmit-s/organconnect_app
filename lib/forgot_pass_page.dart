import 'package:flutter/material.dart';
import 'package:organconnect_app/login_page.dart'; // Import the LoginPage for navigation
import 'components/components.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: const Color(0xffFFFDF5),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FORGOT PASSWORD",
                  style: TextStyle(
                    color: Color(0xffFF4C5B),
                    fontSize: screenWidth * 0.06, // Adjusted to 8% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20), // Reduced height
                Text(
                  "Please enter your email address to reset your password.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Adjusted to 4% of screen width
                    color: Colors.black54, // Optional: Change color for better visibility
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
                SizedBox(height: 40),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  width: screenWidth * 0.9, readOnly: false, // 90% of screen width
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();

                    bool isValidEmail(String email) {
                      return RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(email);
                    }

                    if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter your email!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    } else if (!isValidEmail(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter a valid email!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    } else {
                      // Here you would typically send a password reset request to your backend
                      // For demonstration, we'll just show a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Password reset link sent to your email!"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // Optionally navigate back to the login page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(170, 60),
                    backgroundColor: Color(0xffFF4C5B),
                  ),
                  child: Text(
                    "Send Reset Link",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06, // 6% of screen width
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 1),
                    ),
                    SizedBox(width: 4),
                    Text("Or go back to"),
                    SizedBox(width: 4),
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(170, 60),
                    backgroundColor: Color(0xffFF4C5B),
                  ),
                  child: Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06, // 6% of screen width
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
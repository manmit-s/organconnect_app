import "package:flutter/material.dart";
import "package:organconnect_app/styles.dart";
import "package:organconnect_app/who_are_you.dart";
import "components/components.dart";

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFDF5),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ORGANCONNECT",
                  style: TextStyle(
                    color: Color(0xffFF4C5B),
                    fontSize: screenWidth * 0.1, // 10% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Text("LOGIN", style: title),
                SizedBox(height: 40),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  width: screenWidth * 0.9, // 90% of screen width
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                  width: screenWidth * 0.9, // 90% of screen width
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    bool isValidEmail(String email) {
                      return RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(email);
                    }

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please fill in both fields!"),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WhoAreYou()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(170, 60),
                    backgroundColor: Color(0xffFF4C5B),
                  ),
                  child: Text(
                    "Log In",
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
                    Text("Or continue with"),
                    SizedBox(width: 4),
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton('assets/images/google_logo.png', () {}),
                    SizedBox(width: 30),
                    _buildSocialButton('assets/images/adhaar_logo.png', () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(assetPath),
        ),
        decoration: BoxDecoration(
          color: Color(0xffFFE2E3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffFF4C5B), width: 2),
        ),
      ),
    );
  }
}
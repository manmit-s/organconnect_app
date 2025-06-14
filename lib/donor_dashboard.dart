import 'package:flutter/material.dart';

class DonorDashboard extends StatelessWidget {
  const DonorDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFDF5),
      appBar: AppBar(
        title: const Text('Donor Dashboard', style: TextStyle(color: Color(0xffFFFDF5)),),
        backgroundColor: const Color(0xffFF4C5B),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, Donor!',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF4C5B),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            _DashboardCard(
              icon: Icons.favorite,
              title: 'My Donations',
              subtitle: 'View your donation history and status',
              onTap: () {
                // Navigate to My Donations screen or any other relevant screen
              },
            ),
            SizedBox(height: screenHeight * 0.03),
            _DashboardCard(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'View updates and alerts',
              onTap: () {
                // Navigate to Notifications screen
              },
            ),
            SizedBox(height: screenHeight * 0.03),
            _DashboardCard(
              icon: Icons.settings,
              title: 'Profile Settings',
              subtitle: 'Update your details',
              onTap: () {
                // Navigate to Profile Settings screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _DashboardCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.025, horizontal: screenWidth * 0.05),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffFF4C5B),
                radius: screenWidth * 0.08,
                child: Icon(icon, color: Colors.white, size: screenWidth * 0.08),
              ),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2D2D2D),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Color(0xffFF4C5B)),
            ],
          ),
        ),
      ),
    );
  }
}

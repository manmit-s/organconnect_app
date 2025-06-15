import 'package:flutter/material.dart';
import 'package:organconnect_app/available_organs_page.dart';
import 'package:organconnect_app/hospital_profile_page.dart';
import 'package:organconnect_app/recipient_req_page.dart';

class HospitalDashboard extends StatelessWidget {
  const HospitalDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final primaryColor = const Color(0xffFF4C5B);
    final backgroundColor = const Color(0xffFFFDF5);
    final cardBackground = const Color(0xffFFE2E3);
    final iconColor = primaryColor;
    final textColor = const Color(0xff2D2D2D);
    final subtitleColor = Colors.grey[700];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Hospital Dashboard',
          style: TextStyle(color: backgroundColor),
        ),
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, Hospital!',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            _DashboardCard(
              icon: Icons.group,
              title: 'Recipient Requests',
              subtitle: 'Manage and review recipient organ requests',
              cardColor: cardBackground,
              iconColor: iconColor,
              textColor: textColor,
              subtitleColor: subtitleColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipientRequestsPage()),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.03),
            _DashboardCard(
              icon: Icons.local_hospital,
              title: 'Available Organs',
              subtitle: 'View available organs for transplantation',
              cardColor: cardBackground,
              iconColor: iconColor,
              textColor: textColor,
              subtitleColor: subtitleColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AvailableOrgansPage()),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.03),
            _DashboardCard(
              icon: Icons.settings,
              title: 'Profile Settings',
              subtitle: 'Update hospital profile and settings',
              cardColor: cardBackground,
              iconColor: iconColor,
              textColor: textColor,
              subtitleColor: subtitleColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitalProfilePage()),
                );
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
  final Color cardColor;
  final Color iconColor;
  final Color textColor;
  final Color? subtitleColor;
  final VoidCallback onTap;

  const _DashboardCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.cardColor,
    required this.iconColor,
    required this.textColor,
    this.subtitleColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.025,
            horizontal: screenWidth * 0.05,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: iconColor,
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
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}

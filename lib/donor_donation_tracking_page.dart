import 'package:flutter/material.dart';

class DonorTrackingPage extends StatelessWidget {
  // Example list of registrations/donations
  final List<Registration> registrations = [
    Registration(
      organ: 'Kidney',
      hospital: 'City Hospital',
      status: 'Approved',
      date: DateTime(2024, 7, 10),
    ),
    Registration(
      organ: 'Liver',
      hospital: 'Metro Medical Center',
      status: 'Pending',
      date: DateTime(2024, 8, 5),
    ),
    Registration(
      organ: 'Heart',
      hospital: 'Healthcare Hospital',
      status: 'Declined',
      date: DateTime(2024, 6, 22),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Donations', style: TextStyle(color: Color(0xffFFFDF5)),),
        backgroundColor: const Color(0xffFF4C5B),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: registrations.isEmpty
            ? Center(
          child: Text(
            'No donation registrations found.',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        )
            : ListView.separated(
          itemCount: registrations.length,
          separatorBuilder: (context, index) => SizedBox(height: screenHeight * 0.02),
          itemBuilder: (context, index) {
            final registration = registrations[index];
            return _RegistrationCard(
              registration: registration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            );
          },
        ),
      ),
    );
  }
}

class Registration {
  final String organ;
  final String hospital;
  final String status;
  final DateTime date;

  Registration({
    required this.organ,
    required this.hospital,
    required this.status,
    required this.date,
  });
}

class _RegistrationCard extends StatelessWidget {
  final Registration registration;
  final double screenWidth;
  final double screenHeight;

  const _RegistrationCard({
    Key? key,
    required this.registration,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (registration.status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'declined':
        return Colors.red;
      default:
        return Color(0xffFFFDF5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              registration.organ,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xffFF4C5B),
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              'Hospital: ${registration.hospital}',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Text(
              'Date Registered: ${_formatDate(registration.date)}',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  registration.status,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} '
        '${_getMonthName(date.month)} '
        '${date.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
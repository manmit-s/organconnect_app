import 'package:flutter/material.dart';

class DonorNotificationsPage extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Urgent Kidney Donation Needed',
      description: 'A patient near you requires a kidney urgently.',
      dateTime: DateTime.now().subtract(Duration(minutes: 15)),
      isEmergency: true,
    ),
    NotificationItem(
      title: 'Blood Donation Camp',
      description: 'Join the blood donation camp at Central Park this weekend.',
      dateTime: DateTime.now().subtract(Duration(hours: 3)),
      isEmergency: false,
    ),
    NotificationItem(
      title: 'Liver Donor Needed',
      description: 'Hospital requesting liver donation nearby immediate assistance required.',
      dateTime: DateTime.now().subtract(Duration(days: 1, hours: 2)),
      isEmergency: true,
    ),
  ];

  DonorNotificationsPage({Key? key}) : super(key: key);

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hours ago';
    } else {
      return '${diff.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xffFF4C5B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? Center(
        child: Text(
          'No notifications at the moment.',
          style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      )
          : ListView.separated(
        padding: EdgeInsets.all(screenWidth * 0.05),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.02),
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            color: notification.isEmergency ? Color(0xffffd6d6) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.04,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    notification.isEmergency ? Icons.warning_rounded : Icons.notifications,
                    color: notification.isEmergency ? Colors.red : Color(0xffFF4C5B),
                    size: screenWidth * 0.08,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2D2D2D),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          notification.description,
                          style: TextStyle(
                            fontSize: screenWidth * 0.037,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          _formatDateTime(notification.dateTime),
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final DateTime dateTime;
  final bool isEmergency;

  NotificationItem({
    required this.title,
    required this.description,
    required this.dateTime,
    this.isEmergency = false,
  });
}
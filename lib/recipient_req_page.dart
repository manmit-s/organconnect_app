import 'package:flutter/material.dart';

class RecipientRequestsPage extends StatelessWidget {
  // Sample list of recipient requests (replace with real data)
  final List<RecipientRequest> requests = [
    RecipientRequest(
      patientName: 'Ravi Teja',
      organNeeded: 'Kidney',
      urgency: 'High',
      hospital: 'City Hospital',
      requestDate: DateTime(2024, 7, 15),
      status: 'Pending',
    ),
    RecipientRequest(
      patientName: 'Anu Pillai',
      organNeeded: 'Liver',
      urgency: 'Medium',
      hospital: 'Metro Medical Center',
      requestDate: DateTime(2024, 6, 30),
      status: 'Approved',
    ),
    RecipientRequest(
      patientName: 'Anuj Sha',
      organNeeded: 'Heart',
      urgency: 'Critical',
      hospital: 'Healthcare Hospital',
      requestDate: DateTime(2024, 7, 10),
      status: 'Pending',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipient Requests', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xffFF4C5B),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: requests.isEmpty
            ? Center(
          child: Text(
            'No recipient requests available.',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        )
            : ListView.separated(
          itemCount: requests.length,
          separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.02),
          itemBuilder: (context, index) {
            final request = requests[index];
            return _RecipientRequestCard(
              request: request,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            );
          },
        ),
      ),
    );
  }
}

class RecipientRequest {
  final String patientName;
  final String organNeeded;
  final String urgency;
  final String hospital;
  final DateTime requestDate;
  final String status;

  RecipientRequest({
    required this.patientName,
    required this.organNeeded,
    required this.urgency,
    required this.hospital,
    required this.requestDate,
    required this.status,
  });
}

class _RecipientRequestCard extends StatelessWidget {
  final RecipientRequest request;
  final double screenWidth;
  final double screenHeight;

  const _RecipientRequestCard({
    Key? key,
    required this.request,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (request.status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'declined':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getUrgencyColor() {
    switch (request.urgency.toLowerCase()) {
      case 'critical':
        return Colors.redAccent;
      case 'high':
        return Colors.orangeAccent;
      case 'medium':
        return Colors.yellow[700]!;
      case 'low':
        return Colors.greenAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  request.patientName,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffFF4C5B),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.005,
                    horizontal: screenWidth * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: _getUrgencyColor().withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    request.urgency.toUpperCase(),
                    style: TextStyle(
                      color: _getUrgencyColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.033,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Organ Needed: ${request.organNeeded}',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Hospital: ${request.hospital}',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Requested On: ${_formatDate(request.requestDate)}',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
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
                  request.status,
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
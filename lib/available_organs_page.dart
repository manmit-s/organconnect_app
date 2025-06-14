import 'package:flutter/material.dart';

class AvailableOrgansPage extends StatelessWidget {
  // Example list of available organs in inventory
  final List<AvailableOrgan> organs = [
    AvailableOrgan(
      organName: 'Kidney',
      quantity: 3,
      lastUpdated: DateTime(2024, 7, 15),
    ),
    AvailableOrgan(
      organName: 'Liver',
      quantity: 2,
      lastUpdated: DateTime(2024, 7, 10),
    ),
    AvailableOrgan(
      organName: 'Heart',
      quantity: 1,
      lastUpdated: DateTime(2024, 7, 12),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Organs', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xffFF4C5B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: organs.isEmpty
            ? Center(
          child: Text(
            'No available organs found.',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.grey[600],
            ),
          ),
        )
            : ListView.separated(
          itemCount: organs.length,
          separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.02),
          itemBuilder: (context, index) {
            final organ = organs[index];
            return _AvailableOrganCard(
              organ: organ,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            );
          },
        ),
      ),
    );
  }
}

class AvailableOrgan {
  final String organName;
  final int quantity;
  final DateTime lastUpdated;

  AvailableOrgan({
    required this.organName,
    required this.quantity,
    required this.lastUpdated,
  });
}

class _AvailableOrganCard extends StatelessWidget {
  final AvailableOrgan organ;
  final double screenWidth;
  final double screenHeight;

  const _AvailableOrganCard({
    Key? key,
    required this.organ,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              organ.organName,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xffFF4C5B),
              ),
            ),
            Text(
              'Qty: ${organ.quantity}',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.grey[800],
              ),
            ),
            Text(
              'Updated: ${_formatDate(organ.lastUpdated)}',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey[600],
              ),
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
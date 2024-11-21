import 'package:flutter/material.dart';
// Custom Widget for Timeline Card
class TimelineCard extends StatelessWidget {
  final String activityName;
  final String time;
  final String description;
  final bool isLast;

  const TimelineCard({
    super.key,
    required this.activityName,
    required this.time,
    required this.description,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // The Timeline Circle
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 15),
          // Activity Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$activityName - $time',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          // Line after each activity except the last one
          if (!isLast)
            Container(
              height: 2,
              width: 20,
              color: Colors.blueAccent.withOpacity(0.3),
            ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<Map<String, String>> activities = [
    {
      'activity': 'Arrive in Paris',
      'time': '10:00 AM',
      'description': 'Arrive at the airport and transfer to hotel.',
    },
    {
      'activity': 'Visit Eiffel Tower',
      'time': '1:00 PM',
      'description': 'Explore the Eiffel Tower and enjoy panoramic views.',
    },
    {
      'activity': 'Dinner at Le Jules Verne',
      'time': '7:00 PM',
      'description': 'Enjoy dinner at the Michelin-starred restaurant.',
    },
    // Add more activities as needed
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double halfScreenHeight = screenHeight / 3;

    return SingleChildScrollView(
      child: Column(
        children: [
          // "Current Trip" Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Trip',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trip Title: Amazing Paris Trip',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Location: Paris, France',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'From: 01-Dec-2024 To: 15-Dec-2024',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // "Activity Timeline" Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Activity Timeline',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: activities.map((activity) {
                      int index = activities.indexOf(activity);
                      return TimelineCard(
                        activityName: activity['activity']!,
                        time: activity['time']!,
                        description: activity['description']!,
                        isLast: index == activities.length - 1,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

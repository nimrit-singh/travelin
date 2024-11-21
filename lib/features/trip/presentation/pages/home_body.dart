import 'package:flutter/material.dart';

import '../components/timeline_card.dart';
import '../components/upcoming_trip_card.dart';

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

  final List<Map<String, String>> upcomingTrips = [
    {
      'tripName': 'Trip to London',
      'destination': 'London, UK',
      'dates': '01-Jan-2025 to 10-Jan-2025',
    },
    {
      'tripName': 'Trip to New York',
      'destination': 'New York, USA',
      'dates': '15-Jan-2025 to 20-Jan-2025',
    },
    {
      'tripName': 'Trip to Tokyo',
      'destination': 'Tokyo, Japan',
      'dates': '01-Feb-2025 to 10-Feb-2025',
    },
    // Add more upcoming trips as needed
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    print(upcomingTrips);
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

          // "Upcoming Trips" Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming Trips',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  // height: 200, // Fixed height for the horizontal list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: upcomingTrips.length,
                    itemBuilder: (context, index) {
                      var trip = upcomingTrips[index];
                      return UpcomingTripCard(
                        tripName: trip['tripName']!,
                        destination: trip['destination']!,
                        dates: trip['dates']!,
                      );
                    },
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

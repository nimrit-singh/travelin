import 'package:flutter/material.dart';
import 'package:travelin/features/trip/presentation/components/trip_tile.dart';

class TripHistory extends StatelessWidget {
  const TripHistory({super.key});

  // List of arbitrary trip names
  final items = const [
    'Trip to Paris',
    'New York Adventure',
    'Tokyo Sightseeing Tour',
    'Road Trip to California',
    'Hiking in the Swiss Alps',
    'Cultural Exploration in Morocco',
    'Safari in Kenya',
    'Beach Vacation in Bali',
    'Historic Tour of Rome',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip History"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return TripTile(name: items[index]);
          },
        ),
      ),
    );
  }
}

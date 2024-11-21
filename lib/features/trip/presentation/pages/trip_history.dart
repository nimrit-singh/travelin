import 'package:flutter/material.dart';
import 'package:travelin/features/trip/presentation/components/trip_tile.dart';

class TripHistory extends StatelessWidget {
  const TripHistory({super.key});
  final items = const ['Item 1','Item 2','Item 3','Item 4','Item 5','Item 6','Item 7','Item 8','Item 9',];
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TripTile(name:items[index]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travelin/features/trip/presentation/components/activity_card.dart';
import 'package:travelin/features/trip/presentation/components/trip_card.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final items = const ['Trip 1','Trip 2','Trip 3','Trip 1','Trip 2','Trip 3'];

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double halfScreenHeight = screenHeight / 3;

    return SingleChildScrollView(child:Column(
      children: [
        Text('Current Trip'),
        Text('Trip title'),
        Text('Trip location'),
        Text('Trip from to'),
        Container(
          height: halfScreenHeight,
          child: Flex(
              direction: Axis.vertical,
              children:[ Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ActivityCard(ayName: items[index]);
                  },
                ),),
              ]),
        ),
        Text('Upcoming Trips'),
        Container(
          height: halfScreenHeight,
          child: Flex(
            direction: Axis.horizontal,
            children:[ Expanded(
              flex: 1,
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return TripCard(tripName: items[index]);
            },
                  ),),
          ]),
        ),
      ],
    ),

    );
  }
}

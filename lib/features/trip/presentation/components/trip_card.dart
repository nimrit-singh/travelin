import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final String tripName;
  const TripCard({super.key, required this.tripName});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black54,
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    tripName,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'trip location',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),const SizedBox(height: 10),
                  Text(
                    'trip from to',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(width:3)
              ),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Activities:10',
                      style: const TextStyle(
                        fontSize: 10,
                      )),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          iconSize: 18,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                          iconSize: 18,
                        ),],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

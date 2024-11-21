import 'package:flutter/material.dart';
class TripTile extends StatelessWidget {
  final String name;
  const TripTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'Details of the trip will be displayed here.',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.blueAccent,
        ),
        onTap: () {
          // Navigate to the trip details screen (you can implement this functionality)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You tapped on $name')),
          );
        },
      ),
    );
  }
}
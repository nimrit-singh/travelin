import 'package:flutter/material.dart';
class ActivityCard extends StatelessWidget {
  final String ayName;
  const ActivityCard({super.key,required this.ayName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        Text(ayName),  Container(
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
      ],),
    ) ;
  }
}

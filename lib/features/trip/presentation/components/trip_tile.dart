import 'package:flutter/material.dart';
class TripTile extends StatelessWidget {
  final String name;
  const TripTile({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.5),
      padding: EdgeInsets.symmetric(horizontal:25,vertical: 10),
      decoration: BoxDecoration(

          color: Theme.of(context).colorScheme.secondary,
        // border: Border.all(width: 2 color: The),
        borderRadius: BorderRadius.circular(20)
      ),
      height:100 ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name,style:TextStyle(fontSize: 25)),IconButton(onPressed: (){}, icon: Icon(Icons.info_outline_rounded))],

      ),
    );
  }
}

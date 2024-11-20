import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),
        color: Colors.black,),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications),color: Colors.black),]
      ),
      body: const Text("body"),
      bottomNavigationBar:Container(
        // decoration:BoxDecoration(borderRadius:Bo ),
          child:  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[BottomNavigationBarItem(icon: Icon(Icons.home) ,label:"Home"),BottomNavigationBarItem(icon: Icon(Icons.add),label:"add a new trip"),BottomNavigationBarItem(icon: Icon(Icons.work_history_outlined),label:"Previous Trips") ],
      backgroundColor:Colors.black,unselectedItemColor: Colors.white,)
    )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travelin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:provider/provider.dart';
import 'package:travelin/features/trip/presentation/components/trip_card.dart';
import 'package:travelin/features/trip/presentation/pages/trip_history.dart';
import 'add_trip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.black,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  color: Colors.black),
              IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  icon: const Icon(Icons.logout_rounded))
            ]),
        bottomNavigationBar: Container(
          width: 10,
          padding: const EdgeInsets.all(00),
          margin: EdgeInsets.all(10.00),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Theme.of(context).colorScheme.tertiary,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.add_box),
                icon: Icon(Icons.add_box_outlined),
                label: 'new trip',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.history),
                icon: Icon(Icons.history_toggle_off_rounded),
                label: 'history',
              ),
            ],
          ),
        ),
        body: <Widget>[HomeBody(), AddTrip(), TripHistory()][currentPageIndex]);
  }
}

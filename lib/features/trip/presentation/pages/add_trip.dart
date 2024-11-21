import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:travelin/features/auth/presentation/components/my_button.dart';
import 'package:travelin/features/auth/presentation/components/my_text_field.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({super.key});

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  final titleController = TextEditingController();
  final tlController = TextEditingController();
  final fromController = TextEditingController();
  final activityController = TextEditingController();
  final transportController = TextEditingController();
  final mealController = TextEditingController();
  final toController = TextEditingController();
  final List<int> _items = List<int>.generate(5, (int index) => index);

  // List to store added activities
  List<String> activitiesList = [];

  void addItinerary() {
    // Add itinerary creation logic
    final itinerary = {
      'title': titleController.text,
      'from': fromController.text,
      'to': toController.text,
      'location': tlController.text,
      'activities': activitiesList,
    };

    // For example, you can print the itinerary to the console
    print('Itinerary Created: $itinerary');
    // You could also save the itinerary to a database or perform other operations
  }

  void addActivity() {
    // Ensure that the activity is not empty
    if (activityController.text.isNotEmpty) {
      setState(() {
        activitiesList.add(activityController.text);
      });
      activityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.secondary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.secondary.withOpacity(0.15);
    final Color draggableItemColor = colorScheme.secondary;

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            MyTextField(
                controller: titleController,
                hintText: 'Trip title',
                obscureText: false),
            const SizedBox(height: 25),
            Container(
                width: 350.00,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: MyTextField(
                          controller: fromController,
                          hintText: 'From (DD-MM-YYY)',
                          obscureText: false),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: MyTextField(
                            controller: toController,
                            hintText: 'To (DD-MM-YYY)',
                            obscureText: false))
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  MyTextField(
                      controller: tlController,
                      hintText: 'Trip location',
                      obscureText: false),
                  const SizedBox(
                    height: 20,
                  ),
                  // ReorderableListView displaying added activities
                  Container(
                    height: 200,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child: ReorderableListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            proxyDecorator: proxyDecorator,
                            children: <Widget>[
                              for (int index = 0; index < activitiesList.length; index++)
                                ListTile(
                                  key: Key('$index'),
                                  tileColor: index.isOdd
                                      ? oddItemColor
                                      : evenItemColor,
                                  title: Text(activitiesList[index]),
                                ),
                            ],
                            onReorder: (int oldIndex, int newIndex) {
                              setState(() {
                                if (oldIndex < newIndex) {
                                  newIndex -= 1;
                                }
                                final String activity = activitiesList.removeAt(oldIndex);
                                activitiesList.insert(newIndex, activity);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      MyTextField(
                          controller: activityController,
                          hintText: 'Activity Name',
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                          controller: mealController,
                          hintText: 'Meals (meal1,meal2...)',
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                          controller: transportController,
                          hintText: 'Transportation (transport1,transport2...)',
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MyButton(
                text: "Create Activity",
                onTap: addActivity,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MyButton(
              text: "Create Itinerary",
              onTap: addItinerary,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

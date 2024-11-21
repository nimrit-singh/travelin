import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key,required this.text,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
        borderRadius:BorderRadius.circular(12.0),),
        child: Center(
          child: Text(text,
          style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
        ),
      ),
    );
  }
}

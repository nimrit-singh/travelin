import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelin/firebase_options.dart';
import 'package:travelin/pages/material_pages/home_material_page.dart';
import 'package:travelin/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(
      ChangeNotifierProvider(create:(context)=>ThemeProvider(),
      child:const MyApp()))
  ;

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
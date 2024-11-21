import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelin/app.dart';
import 'package:travelin/firebase_options.dart';
import 'package:travelin/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(
      ChangeNotifierProvider(create:(context)=>ThemeProvider(),
      child:MyApp()))
  ;

}

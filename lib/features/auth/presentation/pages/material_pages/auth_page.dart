import 'package:travelin/features/auth/presentation/pages/material_pages/login_page.dart';
import 'package:travelin/features/auth/presentation/pages/material_pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage=true;
  //toggle between pages
  void togglePages(){
    setState((){
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(togglePages: togglePages,);
    }else{
      return RegisterPage(togglePages: togglePages);
    }
  }
}

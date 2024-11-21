/*
Login Page

on this page an existing user can login using their:
-email
-pw
--------------------------------
once user successfully logins they will be redirected to the homepage
 if user doesnt have an account user can go to register page to create one

 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelin/features/auth/presentation/components/my_button.dart';
import 'package:travelin/features/auth/presentation/components/my_text_field.dart';
import 'package:travelin/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});
//login button pressed
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  void login() {
    final String email = emailController.text;
    final String pw = pwController.text;
    //auth cubit
    final authCubit = context.read<AuthCubit>();
    //ensure email and pw are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(email, pw);
    } else {
      //display an error
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter both email and password")));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              color: Theme.of(context).colorScheme.primary,
            )),
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_open_rounded,
                          size: 80,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        //welcome back msg
                        const SizedBox(height: 50),
                        Text("Welcome Back, you've been missed!",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                            )),

                        const SizedBox(height: 25),
                        //email textfield
                        MyTextField(
                            controller: emailController,
                            hintText: "john@exxample.com",
                            obscureText: false),
                        //  pw textfield
                        const SizedBox(height: 10),
                        MyTextField(
                            controller: pwController,
                            hintText: "password",
                            obscureText: true),
                        //   login button
                        const SizedBox(height: 25),
                        MyButton(text: "Login", onTap: login),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a member?",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            GestureDetector(
                                onTap: widget.togglePages,
                                child: Text(
                                  " Register Now ",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                        //   not a member register now
                      ],
                    )))));
  }
}

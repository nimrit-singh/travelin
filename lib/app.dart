import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelin/features/auth/data/firebase_auth_repo.dart';
import 'package:travelin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:travelin/features/auth/presentation/cubits/auth_states.dart';
import 'package:travelin/features/auth/presentation/pages/material_pages/auth_page.dart';
import 'package:travelin/features/trip/presentation/pages/home_page.dart';
import 'package:travelin/theme/theme_provider.dart';
import 'package:provider/provider.dart';

/*
APP-Root level
 repos for db
 -firebase
 bloc provider: for state management
 -auth
 -profile
 -post
 -search
 -theme
 check auth states
 -unauthenticated -> auth page(login/register)
 -authenticated -> home page
 */
class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              BlocConsumer<AuthCubit, AuthState>(builder: (context, authState) {
            print(authState);
            // unauth
            if (authState is Unauthenticated) {
              return const AuthPage();
            }
            //authenticated..
            if (authState is Authenticated) {
              return const HomePage();
            }
            //loading..
            else {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
          }, listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          }),
          theme: Provider.of<ThemeProvider>(context).themeData,
        ));
  }
}

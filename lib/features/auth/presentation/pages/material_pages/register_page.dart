import 'package:flutter/material.dart';
import 'package:travelin/app.dart';
import 'package:provider/provider.dart';
import 'package:travelin/features/auth/presentation/components/my_button.dart';
import 'package:travelin/features/auth/presentation/components/my_text_field.dart';
import '../../cubits/auth_cubit.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key,required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final nameController= TextEditingController();
  final emailController= TextEditingController();
  final pwController= TextEditingController();
  final confirmPwController= TextEditingController();
  void register(){
    //prepare info
    final String name =nameController.text;
    final String email =emailController.text;
    final String pw =pwController.text;
    final String confirmPw =confirmPwController.text;
//auth cubit
   final authCubit= context.read<AuthCubit>();
   //ensure fields arent empty
    if (email.isNotEmpty&&name.isNotEmpty&&pw.isNotEmpty&&confirmPw.isNotEmpty){
      if (pw==confirmPw){
        authCubit.register(name, email, pw);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
    }

  }
//dispose of the controllers in the end
  void dispose(){
    nameController.dispose();
    confirmPwController.dispose();
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),color: Theme.of(context).colorScheme.primary,)),
        body:SafeArea(child:

        Center(
            child:Padding(
                padding:EdgeInsets.symmetric(horizontal: 25.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_open_rounded,
                      size:80,
                      color:Theme.of(context).colorScheme.primary,
                    ),
                    //welcome back msg
                    const SizedBox(height:50),
                    Text("Let's create an account for you",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary,
                          fontSize:16,)
                    ),

                    const SizedBox(height:25),
                    MyTextField(controller: nameController, hintText: "John Doe", obscureText: false),
                    //email textfield
                    const SizedBox(height:10),
                    MyTextField(controller: emailController, hintText: "john@exxample.com", obscureText: false),
                    //  pw textfield
                    const SizedBox(height:10),
                    MyTextField(controller: pwController, hintText: "password", obscureText: true),
                    const SizedBox(height:10),
                    MyTextField(controller: confirmPwController, hintText: "Confirm password", obscureText: true),

                    //   login button
                    const SizedBox(height:25),
                    MyButton(text: "Register", onTap: register),
                    //   not a member register now
                    const SizedBox(height:50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already a member?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        GestureDetector(
                            onTap: widget.togglePages,
                            child: Text(" Login Now ", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                                fontWeight:FontWeight.bold),)
                        ),
                      ],
                    )
                  ],
                )
            )
        )
        )
    );
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logindemoapp/featuers/auth/presentation/components/my_button.dart';
import 'package:logindemoapp/featuers/auth/presentation/components/my_textfield.dart';
import 'package:logindemoapp/featuers/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameControler = TextEditingController();
  final emailController = TextEditingController();

  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();
  void register() {
    final String name = nameControler.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;
    final authCubit = context.read<AuthCubit>();
    if (email.isNotEmpty &&
        pw.isNotEmpty &&
        name.isNotEmpty &&
        confirmPw.isNotEmpty) {
      if (pw == confirmPw) {
        authCubit.register(name, email, pw);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please complete all fields!')));
    }
  }

  @override
  void dispose() {
    nameControler.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 25),
              Text(
                "Lets Create An Account For You",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: 25),

              MyTextfield(
                controller: nameControler,
                hintText: "Full Name",
                obsecureText: false,
              ),
              SizedBox(height: 10),
              MyTextfield(
                controller: emailController,
                hintText: "Enter your email",
                obsecureText: false,
              ),
              SizedBox(height: 10),
              MyTextfield(
                controller: pwController,
                hintText: "Password",
                obsecureText: true,
              ),
              SizedBox(height: 10),
              MyTextfield(
                controller: confirmPwController,
                hintText: "Confirm Password",
                obsecureText: true,
              ),

              SizedBox(height: 25),
              MyButton(
                text: "SIGN UP",
                onTap: () {
                  register();
                },
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.togglePages,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

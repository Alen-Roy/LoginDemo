import 'package:flutter/material.dart';
import 'package:logindemoapp/featuers/auth/presentation/components/my_button.dart';
import 'package:logindemoapp/featuers/auth/presentation/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final pwController = TextEditingController();
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
                "D E M O  R E G I S T E R",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: 25),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              MyButton(text: "LOGIN", onTap: () {}),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
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

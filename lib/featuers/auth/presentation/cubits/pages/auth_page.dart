import 'package:flutter/material.dart';
import 'package:logindemoapp/featuers/auth/presentation/cubits/pages/login_page.dart';
import 'package:logindemoapp/featuers/auth/presentation/cubits/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return LoginPage(togglePages: tooglePages);
    } else {
      return RegisterPage(togglePages: tooglePages);
    }
  }
}

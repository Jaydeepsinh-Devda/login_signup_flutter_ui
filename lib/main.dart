import 'package:flutter/material.dart';
import 'package:test_app1/pages/forget_password_page.dart';
import 'package:test_app1/pages/login_page.dart';
import 'package:test_app1/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        "/login" :(context) => const LoginPage(),
        "/register" :(context) => const RegisterPage(),
        "/forgetpassword" :(context) => const ForgetPasswordPage()
      },
    );
  }
}
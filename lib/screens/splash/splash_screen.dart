import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/screens/home/home_shell.dart';
import 'package:flutter_starter_kit/screens/login/login_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      // Example: Check auth status here
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      Get.offAll(() => isLoggedIn ? HomeShell() : LoginScreen());
    });
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

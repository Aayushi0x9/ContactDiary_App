import 'dart:async';

import 'package:contact_dairy_app/helper/shr_helper.dart';
import 'package:contact_dairy_app/presentations/screens/home/home_screen.dart';
import 'package:contact_dairy_app/presentations/screens/intro/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkStatus();
    });
  }

  Future<void> checkStatus() async {
    ShrHelper srfHelper = ShrHelper();
    bool? status = await srfHelper.getData();
    if (status == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const IntroScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_rounded,
              color: Colors.green,
              size: 100,
            ),
            Text(
              'Contact Dairy',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

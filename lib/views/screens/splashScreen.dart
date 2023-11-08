import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void MySplash() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.homepage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    MySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Spacer(),
            Image.asset(
              "assets/images/logo.png",
              height: 200,
            ),
            Spacer(),
            const Text(
              "Get your product!!",
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Transform.scale(
              scale: 0.5,
              child: CircularProgressIndicator(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/onboarding'),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 28,
          children: [
            Image.asset('assets/images/icon.png', width: 150, height: 150),
            Text(
              'OrderCoffee',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Baskerville',
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

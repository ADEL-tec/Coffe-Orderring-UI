import 'package:coffee_ordering/pages/Coffee_details.dart';
import 'package:coffee_ordering/pages/cart.dart';
import 'package:coffee_ordering/pages/checkout_success.dart';
import 'package:coffee_ordering/pages/home.dart';
import 'package:coffee_ordering/pages/onboarding.dart';
import 'package:coffee_ordering/pages/profile.dart';
import 'package:coffee_ordering/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrderCoffee',
      theme: ThemeData(
        fontFamily: "PublicSans",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Color.fromRGBO(44, 32, 29, 1.0),
          ),
        ),
      ),
      routes: {
        "/home": (ctx) => SplashScreenPage(),
        "/onboarding": (ctx) => OnboardingPage(),
        "/": (ctx) => HomePage(),
        '/coffee-details': (ctx) => CoffeeDetails(),
        '/cart': (ctx) => CartPage(),
        '/profile': (ctx) => ProfilePage(),
        '/checkout-success': (ctx) => Checkoutsuccess(),
      },
    );
  }
}

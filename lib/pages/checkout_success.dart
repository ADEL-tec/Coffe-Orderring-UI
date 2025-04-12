import 'package:flutter/material.dart';

class Checkoutsuccess extends StatelessWidget {
  const Checkoutsuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/success.png", width: 230, height: 230),
              SizedBox(height: 20),
              Text(
                "Félicitations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text(
                "Votre commande a été passée avec succès",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

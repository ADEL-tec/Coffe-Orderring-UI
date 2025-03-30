import 'package:coffee_ordering/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeDetails extends StatefulWidget {
  const CoffeeDetails({super.key});

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  var _quantity = 0;

  @override
  Widget build(BuildContext context) {
    var coffee = ModalRoute.of(context)!.settings.arguments as Coffee;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 500,
            width: double.infinity,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Image.asset(coffee.image),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  "${coffee.price.toStringAsFixed(2)} DA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  coffee.name,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(coffee.description, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _quantity > 0
                              ? setState(() {
                                _quantity -= 1;
                              })
                              : null;
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(_quantity.toString()),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity += 1;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                FilledButton(onPressed: () {}, child: Text('Acheter')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

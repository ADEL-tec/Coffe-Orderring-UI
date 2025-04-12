import 'package:coffee_ordering/constents.dart';
import 'package:coffee_ordering/models/cartItem.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mon panier')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartData.cartItems.length,
              padding: EdgeInsets.all(15),
              itemBuilder:
                  (ctx, index) => ItemCard(item: cartData.cartItems[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text('Livraison:'),
                          Text(
                            '${200.toStringAsFixed(2)} DA',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Total:'),
                          Text(
                            '${cartData.totalPrice.toStringAsFixed(2)} DA',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout-success');
                    },
                    child: Text('Checkout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    var coffee = categories[0].coffeList.firstWhere(
      (i) => i.id == item.coffeeId,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        spacing: 20,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Card(child: Image.asset(coffee.image)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Text('Volume:'),
                    Text(
                      "${coffee.volume}ml",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${coffee.price.toStringAsFixed(2)} DA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              Text('${item.qty}X', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

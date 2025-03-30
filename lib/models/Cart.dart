import 'package:coffee_ordering/models/cartItem.dart';

class Cart {
  final List<CartItem> cartItems;
  final double totalPrice;

  Cart({required this.cartItems, required this.totalPrice});
}

import 'package:coffee_ordering/models/Cart.dart';
import 'package:coffee_ordering/models/cartItem.dart';
import 'package:coffee_ordering/models/coffee.dart';

final List<Coffee> coffeeItems = [
  Coffee(
    id: '#1',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#2',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#3',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#4',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#5',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#6',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/cup1.png',
    volume: 30,
    price: 3.0,
  ),
];

final List<String> categories = [
  'Cappuccino',
  'Expresso',
  'Latte',
  'Mocha',
  'Americano',
  'Macchiato',
  'Flat White',
  'Café au lait',
  'Ristretto',
  'Affogato',
];

final Cart cartData = Cart(
  cartItems: [
    CartItem(coffeeId: '#1', qty: 2),
    CartItem(coffeeId: "#2", qty: 5),
    CartItem(coffeeId: "#3", qty: 1),
    CartItem(coffeeId: "#4", qty: 3),
  ],
  totalPrice: 1500,
);

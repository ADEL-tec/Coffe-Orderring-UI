import 'package:coffee_ordering/models/Cart.dart';
import 'package:coffee_ordering/models/cartItem.dart';
import 'package:coffee_ordering/models/category.dart';
import 'package:coffee_ordering/models/coffee.dart';

/*
final List<Coffee> coffeeItems = [
  Coffee(
    id: '#1',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/categories/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#2',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/categories/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#3',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/categories/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#4',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/categories/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#5',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/categories/cup1.png',
    volume: 30,
    price: 3.0,
  ),
  Coffee(
    id: '#6',
    name: "Iced Cappuccino",
    description: "this is a long description",
    image: 'assets/images/categories/cup1.png',
    volume: 30,
    price: 3.0,
  ),
];
*/
final List<MyCategory> categories = [
  MyCategory(
    name: "À base d’Espresso",
    coffeList: [
      Coffee(
        id: '#1',
        name: "Espresso",
        description: "Un café court, intense et riche en arômes.",
        image: 'assets/images/categories/espresso.png',
        volume: 30,
        price: 20.0,
      ),

      Coffee(
        id: '#2',
        name: "Américano",
        description:
            "Un espresso allongé avec de l’eau chaude pour une saveur plus douce.",
        image: 'assets/images/categories/americano.png',
        volume: 150,
        price: 25.0,
      ),

      Coffee(
        id: '#3',
        name: "Latte",
        description:
            "Un espresso mélangé avec une grande quantité de lait chaud.",
        image: 'assets/images/categories/latte.png',
        volume: 250,
        price: 35.0,
      ),

      Coffee(
        id: '#4',
        name: "Cappuccino",
        description:
            "Un espresso équilibré avec du lait chaud et une mousse onctueuse.",
        image: 'assets/images/categories/cappuccino.png',
        volume: 200,
        price: 35.0,
      ),

      Coffee(
        id: '#5',
        name: "Flat White",
        description: "Un espresso avec une fine couche de lait chaud soyeux.",
        image: 'assets/images/categories/flatwhite.png',
        volume: 180,
        price: 35.0,
      ),

      Coffee(
        id: '#6',
        name: "Macchiato",
        description:
            "Un espresso surmonté d’une petite touche de mousse de lait.",
        image: 'assets/images/categories/macchiato.png',
        volume: 60,
        price: 28.0,
      ),

      Coffee(
        id: '#7',
        name: "Moka",
        description:
            "Un mélange délicieux d’espresso, de chocolat et de lait chaud.",
        image: 'assets/images/categories/mocha.png',
        volume: 250,
        price: 40.0,
      ),
    ],
  ),
  MyCategory(
    name: 'Cafés Glacés',
    coffeList: [
      Coffee(
        id: '#8',
        name: "Américano Glacé",
        description:
            "Un espresso froid allongé avec de l’eau et des glaçons. Rafraîchissant et léger.",
        image: 'assets/images/categories/iced_americano.png',
        volume: 200,
        price: 30.0,
      ),

      Coffee(
        id: '#9',
        name: "Latte Glacé",
        description:
            "Un espresso froid mélangé à du lait et servi sur glace. Doux et lacté.",
        image: 'assets/images/categories/iced_latte.png',
        volume: 250,
        price: 35.0,
      ),

      Coffee(
        id: '#10',
        name: "Cold Brew",
        description:
            "Un café infusé à froid pendant plusieurs heures, doux et naturellement sucré.",
        image: 'assets/images/categories/cold_brew.png',
        volume: 300,
        price: 40.0,
      ),

      Coffee(
        id: '#11',
        name: "Moka Glacé",
        description:
            "Un espresso glacé avec du chocolat et du lait. Un plaisir chocolaté et rafraîchissant.",
        image: 'assets/images/categories/iced_mocha.png',
        volume: 250,
        price: 45.0,
      ),
    ],
  ),
  MyCategory(
    name: 'Gourmands',
    coffeList: [
      Coffee(
        id: '#12',
        name: "Latte Vanille",
        description:
            "Un latte doux et crémeux rehaussé d’une touche de vanille parfumée.",
        image: 'assets/images/categories/vanilla_latte.png',
        volume: 250,
        price: 40.0,
      ),

      Coffee(
        id: '#13',
        name: "Macchiato Caramel",
        description:
            "Un espresso avec du lait chaud et une couche de caramel fondant. Sucré et intense.",
        image: 'assets/images/categories/caramel_macchiato.png',
        volume: 200,
        price: 42.0,
      ),

      Coffee(
        id: '#14',
        name: "Latte Noisette",
        description:
            "Un délicieux latte aromatisé à la noisette. Onctueux et gourmand.",
        image: 'assets/images/categories/hazelnut_latte.png',
        volume: 250,
        price: 40.0,
      ),
    ],
  ),
  MyCategory(
    name: 'Boissons Sans Caféine',
    coffeList: [
      Coffee(
        id: '#15',
        name: "Chocolat Chaud",
        description:
            "Un chocolat chaud onctueux, parfait pour se réchauffer avec douceur.",
        image: 'assets/images/categories/hot_chocolate.png',
        volume: 250,
        price: 35.0,
      ),

      Coffee(
        id: '#16',
        name: "Chai Latte",
        description:
            "Un mélange épicé de thé noir, de lait chaud et d'épices exotiques.",
        image: 'assets/images/categories/chai_latte.png',
        volume: 250,
        price: 40.0,
      ),

      Coffee(
        id: '#17',
        name: "Matcha Latte",
        description:
            "Un latte au thé vert matcha, doux, crémeux et riche en antioxydants.",
        image: 'assets/images/categories/matcha_latte.png',
        volume: 250,
        price: 42.0,
      ),
    ],
  ),
  MyCategory(
    name: 'Jus Frais',
    coffeList: [
      Coffee(
        id: '#18',
        name: "Jus d’Orange Frais",
        description:
            "Un jus d’orange pressé à la main, frais et plein de vitamines.",
        image: 'assets/images/categories/fresh_orange_juice.png',
        volume: 250,
        price: 30.0,
      ),

      Coffee(
        id: '#19',
        name: "Jus de Pomme",
        description: "Un jus de pomme naturel, sucré et rafraîchissant.",
        image: 'assets/images/categories/fresh_apple_juice.png',
        volume: 250,
        price: 35.0,
      ),
    ],
  ),
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

final String pubImagesPref = "assets/images/pub/pub";
final int nmbPubImg = 3;

import 'package:coffee_ordering/constents.dart';
import 'package:coffee_ordering/models/coffee.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool>? _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(categories.length, (_) => false);
    _isSelected![0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Text('Cart'),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(radius: 15, child: Text("4")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Bonjour! Max',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'Trouvez le meilleur café pour vous',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 25),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Rechercher ici',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ToggleButtons(
                    isSelected: _isSelected!,
                    onPressed: (index) {
                      setState(() {
                        _isSelected = List.generate(
                          categories.length,
                          (i) => i == index ? true : false,
                        );
                      });
                    },
                    children: List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(categories[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 330,
                  child: ListView.builder(
                    shrinkWrap: true,

                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeItems.length,
                    itemBuilder:
                        (ctx, index) => ItemCard(coffee: coffeeItems[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/coffee-details', arguments: coffee);
      },
      child: SizedBox(
        width: 280,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(coffee.image, width: 200, height: 200),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton.filled(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

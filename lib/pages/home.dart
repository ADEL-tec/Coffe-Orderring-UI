import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_ordering/constents.dart';
import 'package:coffee_ordering/models/coffee.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<bool>? _isSelected;

  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
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
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(height: 400.0, autoPlay: true),
                    items: List.generate(
                      nmbPubImg,
                      (i) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("$pubImagesPref$i.jpg"),
                      ),
                    ),
                  ),
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
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs:
                      categories.map((label) => Tab(text: label.name)).toList(),
                  labelColor: Colors.black,
                  indicatorColor: Colors.brown,
                  dividerColor: Colors.brown[200],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 330,
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(categories.length, (i) {
                      final coffeeItems = categories[i].coffeList;
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: coffeeItems.length,
                        itemBuilder:
                            (ctx, index) =>
                                ItemCard(coffee: coffeeItems[index]),
                      );
                    }),
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

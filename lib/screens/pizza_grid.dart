import 'package:flutter/material.dart';


class PizzaHomePage extends StatelessWidget {
  const PizzaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: PizzaGrid(),
            ),
            Positioned(
              top: 10,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: const [
                    Text("Pizza", style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaGrid extends StatelessWidget {
  const PizzaGrid({super.key});

  final List<Map<String, String>> pizzas = const [
    {'name': 'Pepperoni pizza', 'desc': 'Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato', 'price': '\$29', 'img': '🍕'},
    {'name': 'Pizza Cheese', 'desc': 'Food pizza dish cuisine junk food, Fast Food, Flatbread, Ingredient', 'price': '\$23', 'img': '🍕'},
    {'name': 'Peppy Paneer', 'desc': 'Chunky paneer, capsicum and red pepper', 'price': '\$27', 'img': '🍕'},
    {'name': 'Mexican Green Wave', 'desc': 'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes', 'price': '\$30', 'img': '🍕'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 60),
      itemCount: pizzas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final pizza = pizzas[index];
        bool isLeft = index % 2 == 0;
        return Transform.translate(
          offset: Offset(0, isLeft ? 30 : 0),
          child: PizzaCard(
            name: pizza['name']!,
            desc: pizza['desc']!,
            price: pizza['price']!,
          ),
        );
      },
    );
  }
}

class PizzaCard extends StatelessWidget {
  final String name;
  final String desc;
  final String price;

  const PizzaCard({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F4F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -25,
            left: 30,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Image.asset('assets/pizza.png', height: 60), // Replace with real asset
            ),
          ),
          Positioned(
            top: 5,
            right: 10,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border, size: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(desc, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                const Spacer(),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  ),
                  child: const Text("Order Now"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_filled, color: Colors.orange),
            Icon(Icons.restore, color: Colors.grey),
            Icon(Icons.shopping_cart_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

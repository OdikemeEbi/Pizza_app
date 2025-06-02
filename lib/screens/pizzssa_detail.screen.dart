import 'package:flutter/material.dart';

class PizzaOrderScreen extends StatefulWidget {
  const PizzaOrderScreen({super.key});

  @override
  State<PizzaOrderScreen> createState() => _PizzaOrderScreenState();
}

class _PizzaOrderScreenState extends State<PizzaOrderScreen> {
  int _pizzaSize = 1; // 0: S, 1: M, 2: L
  int _count = 1;

  final List<String> _sizes = ['S', 'M', 'L'];
  final List<IconData> _ingredients = [
    Icons.local_pizza, // Example icons, replace with images as needed
    Icons.eco,
    Icons.emoji_food_beverage,
    Icons.local_fire_department,
    Icons.rice_bowl,
    Icons.set_meal,
    Icons.spa,
    Icons.fastfood,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Top navigation and favorite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.grey[800]),
                  Icon(Icons.favorite_border, color: Colors.grey[800]),
                ],
              ),
            ),
            // Pizza image with border
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange[50],
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  padding: EdgeInsets.all(16),
                  // child: ClipOval(
                  //   child: Image.asset(
                  //     'assets/pizza.png', // Replace with your image asset
                  //     width: 200,
                  //     height: 200,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ),
            ),
            // Size selector
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_sizes.length, (index) {
                  return GestureDetector(
                    onTap: () => setState(() => _pizzaSize = index),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: _pizzaSize == index ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        _sizes[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _pizzaSize == index ? Colors.white : Colors.grey[800],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Pizza details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pepperoni pizza",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text("5/5", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Description
                  Text(
                    "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  // Ingredients
                  Text("Ingredients (Customizable)", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _ingredients.length,
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemBuilder: (context, index) => CircleAvatar(
                        backgroundColor: Colors.orange[100],
                        child: Icon(_ingredients[index], color: Colors.orange[800]),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Count and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Count
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () => setState(() {
                              if (_count > 1) _count--;
                            }),
                          ),
                          Text(
                            '$_count',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () => setState(() => _count++),
                          ),
                        ],
                      ),
                      // Price
                      Text(
                        "\$29.8",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange[800]),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Order Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Order action
                      },
                      child: Text(
                        "Order Now",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

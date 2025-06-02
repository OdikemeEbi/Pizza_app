import 'package:flutter/material.dart';
import 'package:pizaa_app/data/pizza_data.dart';

class PizzaDetail extends StatelessWidget {
  final PizzaModel pizzaDetails;
  const PizzaDetail({super.key, required this.pizzaDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        children: [
          SizedBox(
            height: 200,width: 200,
            child: Image.asset(pizzaDetails.image, fit: BoxFit.cover,)),
          Text(pizzaDetails.name, style: TextStyle(fontSize: 40),),
        ],
      ),),
    );
  }
}

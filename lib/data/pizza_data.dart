import 'package:pizaa_app/utils/constants/image_constants.dart';

class PizzaModel {
  String name;
  String description;
  String image;
  String price; 

  PizzaModel({
  required this.name, 
  required this.description, 
  required this.image, 
  required this.price});
}


final List<PizzaModel> pizzaData = [
PizzaModel(
name: 'Pepperoni pizza', 
description: 'Pepperoni pizza, Margarita\nPizza Margherita Italian\ncuisine Tomato', 
image: ImageConstants.pizza1, 
price: '\$29'),

PizzaModel(name: 'Pizza Cheese', 
description: 'Food pizza dish cuisine\njunk food, Fast Food,\nFlatbread, Ingredient', 
image: ImageConstants.pizza2, 
price: '\$23'),

PizzaModel(
name: 'Pappy Paneer',
description: 'Food pizza dish cuisine\njunk food, Fast Food,\nFlatbread, Ingredient',
image: ImageConstants.pizza3, 
price: '\$26'),

PizzaModel(
name: 'Mexican Green Wave', 
description: 'Food pizza dish cuisine\njunk food, Fast Food,\nFlatbread, Ingredient', 
image: ImageConstants.pizza4, 
price: '\$33'),

];
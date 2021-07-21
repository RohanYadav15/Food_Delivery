import 'package:flutter/cupertino.dart';
import 'package:food_delivery/UI%20components/widgets/food.dart';
import 'package:food_delivery/UI%20components/widgets/restaurant.dart';
import 'package:food_delivery/logics/models/food_model.dart';
import 'package:food_delivery/logics/models/restaurant_model.dart';

class Order {
  final RestaurantModel restaurant;
  final FoodModel food;
  final String date;
  int quantity = 1;
  set quantitySet(int a) => quantity = a;
  Order({
    required this.restaurant,
    required this.food,
    required this.date,
  });
}

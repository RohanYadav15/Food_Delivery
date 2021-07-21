import 'package:flutter/cupertino.dart';
import 'package:food_delivery/logics/models/food_model.dart';
import 'package:food_delivery/logics/models/order_model.dart';
import 'package:food_delivery/logics/models/restaurant_model.dart';

class CartProvider extends ChangeNotifier {
  List<Order> orders = [];
  void addOrderToList(
      {required RestaurantModel resturant, required FoodModel food}) {
    final DateTime date = DateTime.now();
    orders.add(Order(
      restaurant: resturant,
      food: food,
      date: '${date.month}-${date.day}-${date.year}',
    ));
    notifyListeners();
  }

  void addQuantity(int id) {
    orders[id].quantity++;
    notifyListeners();
  }

  void subtractQuantity(int id) {
    orders[id].quantity--;
    notifyListeners();
  }
}

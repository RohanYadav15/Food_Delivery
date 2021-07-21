import 'package:food_delivery/logics/models/food_model.dart';

class RestaurantModel {
  final String imageId;
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<FoodModel> menu;

  const RestaurantModel(
      {required this.imageId,
      required this.name,
      required this.address,
      required this.rating,
      required this.menu})
      : imageUrl = 'assets/images/$imageId.jpg';
}

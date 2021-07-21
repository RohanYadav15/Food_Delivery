import 'package:flutter/cupertino.dart';
import 'package:food_delivery/logics/models/food_model.dart';
import 'package:food_delivery/logics/models/order_model.dart';
import 'package:food_delivery/logics/models/restaurant_model.dart';

const FoodModel _bread =
    FoodModel(imageId: 'bread', name: 'Bread', price: 1.99);
const FoodModel _burger =
    FoodModel(imageId: 'burger', name: 'Burger', price: 2.99);
const FoodModel _chicken_wings =
    FoodModel(imageId: 'chicken wings', name: 'Chicken Wings', price: 5.99);
const FoodModel _coffee =
    FoodModel(imageId: 'coffee', name: 'Coffee', price: 0.99);
const FoodModel _cookies =
    FoodModel(imageId: 'cookies', name: 'Cookies', price: 6.99);
const FoodModel _croissant =
    FoodModel(imageId: 'croissant', name: 'Croissant', price: 2.99);
const FoodModel _donut =
    FoodModel(imageId: 'donut', name: 'Donut', price: 1.59);
const FoodModel _fries =
    FoodModel(imageId: 'fries', name: 'Fries', price: 2.99);
const FoodModel _momo = FoodModel(imageId: 'momos', name: 'Mo:Mo', price: 9.99);
const FoodModel _pizza =
    FoodModel(imageId: 'pizza', name: 'Pizza', price: 2.89);
const FoodModel _salad =
    FoodModel(imageId: 'salad', name: 'Salad', price: 4.59);
const FoodModel _steak =
    FoodModel(imageId: 'steak', name: 'Steak', price: 14.99);
const FoodModel _tandoori =
    FoodModel(imageId: 'tandoori', name: 'Tandoori', price: 12.49);
const FoodModel _bell_pepper =
    FoodModel(imageId: 'bell_pepper', name: 'Bell Pepper', price: 3.49);
const FoodModel _meal = FoodModel(imageId: 'meal', name: 'Meal', price: 9.49);

const RestaurantModel restaurant_1 = RestaurantModel(
    imageId: 'restaurant_1',
    name: 'Restaurant 1',
    address: 'Downtown, CA',
    rating: 4,
    menu: [_donut, _burger, _chicken_wings, _pizza, _salad, _meal]);
const RestaurantModel restaurant_2 = RestaurantModel(
    imageId: 'restaurant_2',
    name: 'Restaurant 2',
    address: 'Downtown, Kathmandu, NP',
    rating: 5,
    menu: [_momo, _tandoori, _bread, _croissant, _coffee, _steak]);

const RestaurantModel restaurant_3 = RestaurantModel(
    imageId: 'restaurant_3',
    name: 'Restaurant 3',
    address: 'street 6, NY',
    rating: 3,
    menu: [_salad, _fries, _donut, _cookies, _pizza, _bell_pepper]);

const RestaurantModel restaurant_4 = RestaurantModel(
    imageId: 'restaurant_4',
    name: 'Restaurant 4',
    address: 'Bogata, Columbia',
    rating: 3,
    menu: [_pizza, _cookies, _steak, _coffee, _salad]);

const RestaurantModel restaurant_5 = RestaurantModel(
    imageId: 'restaurant_5',
    name: 'Restaurant 5',
    address: 'Los-santos, GTA 5',
    rating: 5,
    menu: [_steak, _pizza, _chicken_wings, _tandoori, _croissant]);

const RestaurantModel restaurant_6 = RestaurantModel(
    imageId: 'restaurant_6',
    name: 'Restaurant 6',
    address: 'Paleto Bay, CA',
    rating: 2,
    menu: [
      _burger,
      _bread,
      _momo,
      _donut,
      _cookies,
      _croissant,
      _coffee,
      _pizza,
      _salad,
      _steak,
      _meal,
      _bell_pepper
    ]);

const RestaurantModel restaurant_7 = RestaurantModel(
    imageId: 'restaurant_7',
    name: 'Restaurant 7',
    address: 'Mt.gordo, GTA 5',
    rating: 4,
    menu: [_meal, _pizza, _bell_pepper, _tandoori, _croissant]);

const RestaurantModel restaurant_8 = RestaurantModel(
    imageId: 'restaurant_8',
    name: 'Restaurant 8',
    address: 'Military Base, GTA 5',
    rating: 1,
    menu: [_steak, _chicken_wings, _croissant]);

List<Order> recent_orders = [
  Order(restaurant: restaurant_2, food: _croissant, date: 'Feb 6 2021'),
  Order(restaurant: restaurant_4, food: _pizza, date: 'June 21 2021'),
  Order(restaurant: restaurant_7, food: _meal, date: 'May 5 2021'),
  Order(restaurant: restaurant_5, food: _chicken_wings, date: 'July 6 2021'),
  Order(restaurant: restaurant_3, food: _salad, date: 'Apr 8 2021'),
];

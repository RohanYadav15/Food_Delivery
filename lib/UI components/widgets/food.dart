import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/logics/models/food_model.dart';
import 'package:food_delivery/logics/models/order_model.dart';
import 'package:food_delivery/logics/models/restaurant_model.dart';
import 'package:food_delivery/logics/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Food extends StatefulWidget {
  final FoodModel model;
  Food({required this.model});
  @override
  State<StatefulWidget> createState() {
    return _Food();
  }
}

class _Food extends State<Food> with SingleTickerProviderStateMixin {
  late RestaurantModel resModel;
  bool isAdded = false;
  final twn = ColorTween(begin: Colors.red, end: Colors.grey);

  @override
  void initState() {
    super.initState();
    resModel = context.read<RestaurantModel>();
    context.read<CartProvider>().orders.forEach((element) {
      if (element.restaurant == resModel && element.food == widget.model) {
        isAdded = true;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.model.imageUrl,
            color: isAdded ? Colors.grey : null,
            colorBlendMode: BlendMode.hue,
            fit: BoxFit.cover,
          ),
          Center(
            child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: 24.0, fontFamily: 'pacifico', height: 1.15),
              child: Visibility(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.model.name),
                    Text('\$${widget.model.price}'),
                  ],
                ),
                replacement: Text(
                  'Bought',
                  style: TextStyle(
                    color: Colors.cyan[200]!,
                  ),
                ),
                visible: !isAdded,
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            bottom: 4.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                shape: CircleBorder(),
                fixedSize: Size(40.0, 40.0),
                primary: Colors.red,
                onSurface: Colors.grey.withOpacity(1.0),
              ),
              onPressed: isAdded
                  ? null
                  : () {
                      context.read<CartProvider>().addOrderToList(
                          resturant: resModel, food: widget.model);
                      setState(() {
                        isAdded = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('1 ${widget.model.name} added to cart!'),
                        duration: Duration(milliseconds: 600),
                      ));
                    },
              child: Icon(
                Icons.add,
                color: isAdded ? Colors.grey : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

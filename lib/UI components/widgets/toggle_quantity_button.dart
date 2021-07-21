import 'package:flutter/material.dart';
import 'package:food_delivery/logics/providers/cart_provider.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:provider/provider.dart';

class ChangeQuantity extends StatelessWidget {
  final int id;
  const ChangeQuantity({required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<CartProvider>().subtractQuantity(id);
            },
            icon: Icon(Icons.remove, color: Colors.red),
          ),
          Text(
            context.watch<CartProvider>().orders[id].quantity.toString(),
            style: kSubLabelTextStyle,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<CartProvider>().addQuantity(id);
              },
              icon: Icon(Icons.add, color: Colors.red)),
        ],
      ),
    );
  }
}

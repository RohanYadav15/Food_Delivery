import 'package:flutter/material.dart';
import 'package:food_delivery/UI%20components/painters/checkout_painter.dart';
import 'package:food_delivery/UI%20components/widgets/toggle_quantity_button.dart';
import 'package:food_delivery/logics/models/order_model.dart';
import 'package:food_delivery/logics/providers/cart_provider.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
              size: 35.0,
            ),
            Text(
              ' Cart-',
              style: kHeaderTextStyle,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Text(
                context.watch<CartProvider>().orders.length.toString(),
                style: kHeaderTextStyle.copyWith(
                  height: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  children:
                      buildOrderColumn(context.watch<CartProvider>().orders))),
          SizedBox(
            width: double.maxFinite,
            height: 100,
            child: CustomPaint(
              painter: CheckoutPainter(),
              child: Text(
                'Checkout',
                style:
                    kHeaderTextStyle.copyWith(color: Colors.green, height: 2.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildOrderColumn(List<Order> orders) {
    double total = 0.00000;
    List<Widget> widgets = [];
    int id = 0;
    orders.forEach((e) {
      total += e.quantity * e.food.price;
      widgets.add(Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            height: 120.0,
            decoration: BoxDecoration(
              border: Border.all(width: 0.8, color: Colors.grey[350]!),
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset(
                        e.food.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(e.food.name, style: kRecentOrdersTS),
                    Text(
                      e.restaurant.name,
                      style: kSubLabelTextStyle,
                    ),
                    ChangeQuantity(id: id),
                  ],
                ),
                Spacer(),
                Text('${e.quantity}*${e.food.price}',
                    style: kRecentOrdersTS.copyWith(
                        fontSize: 22.0, color: Colors.red[300])),
                SizedBox(width: 16.0),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 8.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
        ],
      ));
      id++;
    });

    widgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Text(
              'Total:',
              style:
                  kLabelTextStyle.copyWith(color: Colors.green, fontSize: 26.0),
            ),
            Spacer(),
            Text(
              parseTotal(total),
              style:
                  kRecentOrdersTS.copyWith(color: Colors.green, fontSize: 26.0),
            ),
          ],
        ),
      ),
    );
    return widgets;
  }

  String parseTotal(double total) {
    String strTotal = total.toString();
    List<String> parts = strTotal.split('.');
    String dec = '';
    if (parts[1].length > 2) {
      dec = parts[1].substring(0, 2);
    } else {
      dec = parts[1];
    }
    return '\$${parts[0]}.$dec';
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/UI%20components/screens/cart_screen.dart';
import 'package:food_delivery/UI%20components/widgets/recent_orders.dart';
import 'package:food_delivery/UI%20components/widgets/restaurant.dart';
import 'package:food_delivery/logics/providers/cart_provider.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              //pinned: true,
              floating: true,
              leading: Icon(Icons.person_outline),
              title: Text(
                'Food Delivery',
                style: kHeaderTextStyle,
              ),
              actions: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen())),
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: Container(
                    padding: EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      context.watch<CartProvider>().orders.length.toString(),
                      style: kHeaderTextStyle.copyWith(
                        height: 1.0,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(8.0)),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Search Food or Restaurants',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.clear),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
            ),
            RecentOrders(),
            Provider(create: (context) => restaurant_1, child: Restaurant()),
            Provider(create: (context) => restaurant_2, child: Restaurant()),
            Provider(create: (context) => restaurant_3, child: Restaurant()),
            Provider(create: (context) => restaurant_4, child: Restaurant()),
            Provider(create: (context) => restaurant_5, child: Restaurant()),
            Provider(create: (context) => restaurant_6, child: Restaurant()),
            Provider(create: (context) => restaurant_7, child: Restaurant()),
            Provider(create: (context) => restaurant_8, child: Restaurant()),
          ],
        ),
      ),
    );
  }
}

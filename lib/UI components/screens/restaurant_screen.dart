import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/UI%20components/widgets/food.dart';
import 'package:food_delivery/logics/models/restaurant_model.dart';
import 'package:food_delivery/logics/providers/cart_provider.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  List<Icon> buildRating(int rate) {
    List<Icon> rating = [];
    for (int i = 0; i < rate; i++) {
      rating.add(Icon(
        Icons.star_border_purple500_rounded,
        color: Colors.yellow,
      ));
    }
    return rating;
  }

  @override
  Widget build(BuildContext context) {
    final RestaurantModel model = Provider.of<RestaurantModel>(context);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // pinned: true,
            // snap: true,
            // floating: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Hero(
                tag: model.imageId,
                child: Image.asset(
                  model.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            expandedHeight: 200.0,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.name,
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '0.23 mi',
                        style: kSubLabelTextStyle,
                      )
                    ],
                  ),
                  Row(children: buildRating(model.rating)),
                  Text(
                    model.address,
                    style: kSubLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(
                  backgroundColor: Colors.green,
                  label: Text('Call'),
                  elevation: 8.0,
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                ),
                Chip(
                  label: Text(
                    'Location',
                  ),
                  elevation: 8.0,
                  backgroundColor: Colors.green,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Text(
            'Menu',
            style: kHeaderTextStyle.copyWith(fontSize: 32.0),
            textAlign: TextAlign.center,
          )),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 100 / 75,
              crossAxisCount: 2,
              children: model.menu
                  .map((e) => Food(
                        model: e,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

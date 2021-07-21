import 'package:flutter/material.dart';
import 'package:food_delivery/UI%20components/screens/restaurant_screen.dart';
import 'package:food_delivery/logics/models/restaurant_model.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:provider/provider.dart';

class Restaurant extends StatelessWidget {
  const Restaurant();

  @override
  Widget build(BuildContext context) {
    final RestaurantModel restaurant =
        Provider.of<RestaurantModel>(context, listen: false);
    return SliverToBoxAdapter(
      child: InkWell(
        child: Container(
          height: 140.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Hero(
                    tag: restaurant.imageId,
                    child: Image.asset(
                      restaurant.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      overflow: TextOverflow.ellipsis,
                      style: kLabelTextStyle,
                    ),
                    Row(
                      children: getStars(restaurant.rating),
                    ),
                    Text(
                      restaurant.address,
                      overflow: TextOverflow.ellipsis,
                      style: kSubLabelTextStyle,
                    ),
                    Text('0.2 Miles away')
                  ],
                ),
              ),
              SizedBox(
                  width: 60.0,
                  child: Icon(
                    Icons.navigate_next_rounded,
                    size: 40.0,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Provider.value(
                    value: restaurant, child: RestaurantScreen()))),
      ),
    );
  }

  getStars(int rating) {
    List<Icon> icons = [];
    for (int i = 0; i < rating; i++) {
      icons
          .add(Icon(Icons.star_border_purple500_rounded, color: Colors.yellow));
    }
    return icons;
  }
}

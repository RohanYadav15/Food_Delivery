import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/data.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Orders',
              style: kLabelTextStyle.copyWith(fontSize: 28.0),
            ),
          ),
          Container(
            // change container to sizedbox
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 120.0,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recent_orders.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  //padding: EdgeInsets.all(8.0),
                  width: 320.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(width: 1.2, color: Colors.grey[300]!)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            recent_orders[index].food.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              recent_orders[index].food.name,
                              overflow: TextOverflow.ellipsis,
                              style: kRecentOrdersTS,
                            ),
                            Text(
                              recent_orders[index].restaurant.name,
                              overflow: TextOverflow.ellipsis,
                              style: kRecentOrdersTS.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              recent_orders[index].date,
                              style: kSubLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                        child: RawMaterialButton(
                          onPressed: () => null,
                          fillColor: Colors.red,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          elevation: 4.0,
                          constraints:
                              BoxConstraints(minHeight: 43.0, minWidth: 43.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

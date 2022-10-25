import 'package:flutter/material.dart';

// import '../../../size_config.dart';
import 'categories.dart';
// import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_products.dart';
// import 'special_offers.dart';

class Body extends StatelessWidget {
  Body(this.args, this.number);
  final String args;

  final String number;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: (20)),
            HomeHeader(
              args: args,
              number: number,
            ),
            SizedBox(height: (10)),
            // DiscountBanner(),
            ListCategories(),
            // SpecialOffers(),
            SizedBox(height: (30)),
            PopularProducts(),
            SizedBox(height: (30)),
          ],
        ),
      ),
    );
  }
}

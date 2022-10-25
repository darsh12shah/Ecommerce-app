import 'package:flutter/material.dart';

import 'Product.dart';

class Favorites {
  final Product product;
  final int numOfItem;

  Favorites({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Favorites> demoCarts = [
  Favorites(product: demoProducts[0], numOfItem: 2),
  Favorites(product: demoProducts[1], numOfItem: 1),
  Favorites(product: demoProducts[3], numOfItem: 1),
];

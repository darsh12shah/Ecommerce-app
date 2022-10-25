import 'package:flutter/material.dart';
import '/models/Product.dart';

class Orders {
  final Product product;
  final int numOfItem;

  Orders({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Orders> demoOrders = [
  Orders(product: demoProducts[0], numOfItem: 2),
  Orders(product: demoProducts[1], numOfItem: 1),
  Orders(product: demoProducts[3], numOfItem: 1),
];

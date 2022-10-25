import 'package:flutter/foundation.dart';
import '../models/Product.dart';

class User extends ChangeNotifier {
  final String name;
  final int phone;
  final String email;
  final String auth;
  final List<Product> favorites;
  final List<Product> orders;
  final List<Product> cart;

  User(
      {@required this.name,
      @required this.phone,
      @required this.email,
      @required this.auth,
      @required this.favorites,
      @required this.orders,
      @required this.cart});
}

User user;
void add(User u) {
  user = u;
}

void login() {}

void isVendor() {}
get _getFavorites {}
get _getOrders {}
get _getCart {}
get _getInfo {}
get _updateCart {}
get _deleteCart {}
get _updateFavorites {}
get _deleteFavorite {}
void _updateOrders(Product product) {}

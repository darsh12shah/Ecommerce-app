import 'package:flutter/material.dart';
import '/models/Cart.dart';

import 'package:http/http.dart' as http;

import '../components/cart/body.dart';
import '/components/cart/check_out_card.dart';

var data;

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  Future _getRequest(context, number) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var response = await http.get(
        Uri.parse('http://192.168.0.103:7000/users/' + number + '/getCart'),
        headers: headers);
    if (response.statusCode == 200) {
      data = response.body;
      return response.body.length;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error Occured'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var number = ModalRoute.of(context).settings.arguments;
    _getRequest(context, number);

    return Scaffold(
      appBar: buildAppBar(context, number),
      body: Body(data),
      bottomNavigationBar: CheckoutCard(number: number, data: data),
    );
  }

  AppBar buildAppBar(BuildContext context, String number) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            _getRequest(context, number).toString(),
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

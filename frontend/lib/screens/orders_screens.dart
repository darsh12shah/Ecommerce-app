import 'package:flutter/material.dart';
import '/custom_bottom_navbar.dart';
import '/enums.dart';

import '../components/orders/body.dart';
import 'package:http/http.dart' as http;

var data2;

class OrdersScreen extends StatelessWidget {
  static String routeName = "/orders";
  @override
  Widget build(BuildContext context) {
    final List routeArgs = ModalRoute.of(context).settings.arguments;
    final number = routeArgs[0];
    final args = routeArgs[1];

    Future _getOrders(context, number) async {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var response = await http.get(
          Uri.parse('http://192.168.0.103:7000/users/' + number + '/getOrders'),
          headers: headers);
      if (response.statusCode == 200) {
        data2 = response.body;
        return response.body.length;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error Occured'),
        ));
      }
    }

    return Scaffold(
      appBar: buildAppBar(context, number, _getOrders),
      body: Body(number, data2),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.orders,
        number: number,
        args: args,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, String number, _getOrders) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Orders",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${_getOrders(context, number).toString()} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../custom_bottom_navbar.dart';
import '../enums.dart';

import '../components/profile/body.dart';
import 'package:http/http.dart' as http;

var data3;

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    final List routeArgs = ModalRoute.of(context).settings.arguments;
    final String number = routeArgs[0];
    final args = routeArgs[1];

    Future _getOrders(context, number) async {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var response = await http.get(
          Uri.parse(
              'http://192.168.0.103:7000/users/' + number + '/getProfile'),
          headers: headers);
      if (response.statusCode == 200) {
        data3 = response.body;
        return response.body.length;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error Occured'),
        ));
      }
    }

    _getOrders(context, number);
    return Scaffold(
      body: Body(data3),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
        number: number,
        args: args,
      ),
    );
  }
}

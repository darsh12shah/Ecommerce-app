import 'package:flutter/material.dart';
import '/custom_bottom_navbar.dart';
import '/enums.dart';
import '/models/Favorites.dart';
import 'package:http/http.dart' as http;

import '../components/favorites/body.dart';

var data1;

class FavoritesScreen extends StatelessWidget {
  static String routeName = "/favorites";

  @override
  Widget build(BuildContext context) {
    final List routeargs = ModalRoute.of(context).settings.arguments;
    var number = routeargs[0];
    var args = routeargs[1];

    Future _getFavorites(context, number) async {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var response = await http.get(
          Uri.parse(
              'http://192.168.0.103:7000/users/' + number + '/getFavorites'),
          headers: headers);
      if (response.statusCode == 200) {
        data1 = response.body;
        return response.body.length;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error Occured'),
        ));
      }
    }

    return Scaffold(
      appBar: buildAppBar(context, number, _getFavorites),
      body: Body(number, data1),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.favourite,
        args: args,
        number: number,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, String number, _getFavorites) {
    return AppBar(
      leading: SizedBox(
        width: 1,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Favorites",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${_getFavorites(context, number).toString()} items",
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            width: 100,
          )
        ],
      ),
    );
  }
}

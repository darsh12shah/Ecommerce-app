import 'package:flutter/material.dart';
import '/custom_bottom_navbar.dart';
import '/enums.dart';

import '/components/home/body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.number);
  final String number;
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(args, number),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
        number: number,
        args: args,
      ),
    );
  }
}

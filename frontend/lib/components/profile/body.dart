import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  Body(this.data);
  final data;

  final snackBar = SnackBar(content: Text('LogOut Successfull!'));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ProfilePic(url: data.image),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Icons.face,
            press: () => {},
          ),
          ProfileMenu(
            text: "My Orders",
            icon: Icons.shopping_bag,
            press: () {
              Navigator.pushReplacementNamed(context, '/orders',
                  arguments: [data.mobileNumber, data]);
            },
          ),
          ProfileMenu(
            text: "Favorites",
            icon: Icons.favorite,
            press: () {
              Navigator.pushReplacementNamed(context, '/favorites',
                  arguments: [data.mobileNumber, data]);
            },
          ),
          ProfileMenu(
            text: "Contact",
            icon: Icons.phone,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout,
            press: () {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Future.delayed(Duration(seconds: 2));
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }
}

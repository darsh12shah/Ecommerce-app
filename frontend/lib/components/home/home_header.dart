import 'package:flutter/material.dart';

// import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_feild.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
    @required this.args,
    @required this.number,
  }) : super(key: key);
  final String args;

  final String number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: Icons.shopping_cart,
            numOfitem: 3,
            press: () {
              print(args);
              args == null
                  ? Navigator.pushNamed(context, '/cart', arguments: number)
                  : null;
            },
          ),
        ],
      ),
    );
  }
}

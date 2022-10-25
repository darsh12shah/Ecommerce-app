import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cart_card.dart';

var data;

class Body extends StatefulWidget {
  Body(this.data);
  final data;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (20)),
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget.data[index].id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget.data.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Icon(Icons.delete),
                ],
              ),
            ),
            child: CartCard(data: widget.data[index]),
          ),
        ),
      ),
    );
  }
}

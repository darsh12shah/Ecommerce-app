import 'package:flutter/material.dart';
import '../../rounded_icon_btn.dart';
import '../../models/Product.dart';

import '../../constants.dart';
// import '../../../size_config.dart';

class CustomFeild extends StatefulWidget {
  const CustomFeild({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _CustomFeildState createState() => _CustomFeildState();
}

class _CustomFeildState extends State<CustomFeild> {
  String dropdownValue;
  double quant;
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    if (dropdownValue == null) {
      dropdownValue = widget.product.availability.keys.first;
      quant = 1;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (20), vertical: 0),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: kPrimaryColor,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                print(dropdownValue);
              });
            },
            items: widget.product.availability.keys
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              if (quant == 1) {
              } else {
                setState(() {
                  quant--;
                });
              }
            },
          ),
          SizedBox(width: (20)),
          Text(quant.toString()),
          SizedBox(width: (20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              if (quant == widget.product.availability[dropdownValue]) {
              } else {
                setState(() {
                  quant++;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all((8)),
      height: (40),
      width: (40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

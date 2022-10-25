import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final double price;
  final Map<String, double> availability;

  Product({
    @required this.id,
    @required this.images,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.availability,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
      id: 1,
      images: [
        "1",
        "2",
        "3",
        "4",
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description: description,
      
      availability: {'Small': 3, 'Medium': 2}),
  Product(
      id: 2,
      images: [
        "2",
      ],
      title: "Nike Sport White - Man Pant",
      price: 50.5,
      description: description,
    
      availability: {'Small': 3, 'Medium': 2}),
  Product(
      id: 3,
      images: [
        "3",
      ],
      title: "Gloves XC Omega - Polygon",
      price: 36.55,
      description: description,
      
      availability: {'Small': 3, 'Medium': 2}),
  Product(
      id: 4,
      images: [
        "4",
      ],
      title: "Logitech Head",
      price: 20.20,
      description: description,
      availability: {'Small': 3, 'Medium': 2}),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

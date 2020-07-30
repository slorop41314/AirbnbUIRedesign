import 'package:flutter/material.dart';

class Hotel {
  String name;
  List<String> imageUrl;
  int price;
  double rating;
  String description;
  // String convertedPrice;

  Hotel({
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    // @required this.description,
    this.rating = 0,
    // this.convertedPrice = formatNumberToCurrency(this.price.toDouble());
  });
}

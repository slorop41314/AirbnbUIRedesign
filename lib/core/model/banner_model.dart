import 'package:flutter/material.dart';

class BannerModel {
  String name;
  String imageUrl;
  int averagePrice;
  String description;
  // String convertedPrice;

  BannerModel({
    @required this.name,
    @required this.imageUrl,
    @required this.averagePrice,
    this.description,
    // this.convertedPrice = formatNumberToCurrency(this.price.toDouble());
  });
}

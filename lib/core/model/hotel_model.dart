import 'package:NitipBeli/utils/helper.dart';
import 'package:flutter/material.dart';

class Hotel {
  String name;
  List<String> imageUrl;
  int price;
  // String convertedPrice;

  Hotel({
    @required this.name,
    @required this.imageUrl,
    @required this.price,
    // this.convertedPrice = formatNumberToCurrency(this.price.toDouble());
  });
}

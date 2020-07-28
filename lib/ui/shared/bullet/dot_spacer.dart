import 'package:NitipBeli/ui/metrics.dart';
import 'package:flutter/material.dart';

class DotSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(
        horizontal: content_small_margin,
      ),
      height: 4.0,
      width: 4.0,
      decoration: new BoxDecoration(
        color: Colors.grey[400],
        shape: BoxShape.circle,
      ),
    );
  }
}

import 'package:NitipBeli/ui/metrics.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  final Color buttonColor;

  SecondaryButton({
    @required this.buttonTitle,
    @required this.onTap,
    this.buttonColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin_child_vertical,
      child: OutlineButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(
            5.0,
          ),
        ),
        borderSide: BorderSide(
          color: this.buttonColor,
          width: 1,
        ),
        onPressed: this.onTap,
        child: Container(
          width: double.infinity,
          margin: margin_child,
          child: Text(
            this.buttonTitle,
            style: Theme.of(context).textTheme.button.copyWith(
                  color: this.buttonColor,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/utils/constant.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;

  SecondaryButton({@required this.buttonTitle, @required this.onTap});

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
          color: kColorSecondary,
          width: 1,
        ),
        onPressed: this.onTap,
        child: Container(
          width: double.infinity,
          margin: margin_child,
          child: Text(
            this.buttonTitle,
            style: Theme.of(context).textTheme.button.copyWith(
                  color: kColorSecondary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

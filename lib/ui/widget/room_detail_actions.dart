import 'package:NitipBeli/core/model/hotel_model.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/button/primary_button.dart';
import 'package:NitipBeli/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RoomDetailActions extends StatelessWidget {
  const RoomDetailActions({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Hotel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  formatNumberToCurrency(
                    data.price.toDouble(),
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(" / Night")
              ],
            ),
            Row(
              children: <Widget>[
                RatingBarIndicator(
                  rating: data.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.grey[700],
                  ),
                  unratedColor: Colors.grey[700].withAlpha(40),
                  itemCount: 5,
                  itemSize: 10.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  width: content_small_margin,
                ),
                Text(
                  data.rating.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: 150,
          // height: ,
          child: PrimaryButton(
            buttonTitle: "ADD DATES",
            onTap: () {
              print("Ontap add dates");
            },
          ),
        )
      ],
    );
  }
}

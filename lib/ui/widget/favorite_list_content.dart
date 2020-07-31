import 'package:NitipBeli/core/model/hotel_model.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/bullet/dot_spacer.dart';
import 'package:NitipBeli/ui/shared/image/image.dart';
import 'package:flutter/material.dart';

class FavoriteListContent extends StatelessWidget {
  const FavoriteListContent({
    Key key,
    @required Map<String, dynamic> data,
  })  : _data = data,
        super(key: key);

  final Map<String, dynamic> _data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: content_child_margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                    ),
                    Text(
                      _data["city"],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "3 Homes",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    DotSpacer(),
                    Text(
                      "6 Experience",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: content_child_margin,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final item = _data["data"][index] as Hotel;
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 200,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 130,
                          child: CustomImage(
                            url: item.imageUrl[0],
                          ),
                        ),
                        Text(
                          "Room",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          item.name,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

import 'package:NitipBeli/core/model/banner_model.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/bullet/dot_spacer.dart';
import 'package:NitipBeli/ui/shared/image/image.dart';
import 'package:NitipBeli/ui/shared/loading/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LargeBanner extends StatelessWidget {
  const LargeBanner({
    Key key,
    @required this.item,
  }) : super(key: key);

  final BannerModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: content_child_margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 300,
            child: CustomImage(url: item.imageUrl),
          ),
          Row(
            children: <Widget>[
              Text(
                "ONLINE EXPERIENCE",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              DotSpacer(),
              Text(
                "COOKING",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          Text(
            item.description,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

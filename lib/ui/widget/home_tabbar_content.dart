import 'package:NitipBeli/core/model/hotel_model.dart';
import 'package:NitipBeli/data/hotel_data_city.dart';
import 'package:NitipBeli/ui/shared/bullet/dot_spacer.dart';
import 'package:NitipBeli/ui/shared/loading/loading_indicator.dart';
import 'package:NitipBeli/utils/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeTabBarContent extends StatefulWidget {
  const HomeTabBarContent({
    Key key,
    @required this.category,
  }) : super(key: key);

  final String category;

  @override
  _HomeTabBarContentState createState() => _HomeTabBarContentState();
}

class _HomeTabBarContentState extends State<HomeTabBarContent> {
  List<Hotel> _data = [];

  @override
  void initState() {
    super.initState();
    _getContentData();
  }

  void _getContentData() {
    setState(() {
      _data = hotelData[widget.category];
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 300;
    final double itemWidth = size.width / 2;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: itemWidth / itemHeight,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _data.length > 4 ? 4 : _data.length,
      itemBuilder: (context, index) {
        Hotel item = _data[index];
        return InkWell(
          onTap: () {
            print(item.name);
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 170,
                  imageUrl: item.imageUrl[0],
                  placeholder: (context, url) => Center(
                    child: LoadingIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "VERIFIED",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    DotSpacer(),
                    Text(
                      "BEIJING",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 2,
                ),
                Text(
                  formatNumberToCurrency(item.price.toDouble()),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                RatingBarIndicator(
                  rating: item.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.grey[700],
                  ),
                  unratedColor: Colors.grey[700].withAlpha(40),
                  itemCount: 5,
                  itemSize: 10.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

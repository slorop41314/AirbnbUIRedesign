import 'package:NitipBeli/core/model/banner_model.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/loading/loading_indicator.dart';
import 'package:NitipBeli/utils/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendedHomeWidget extends StatelessWidget {
  const RecommendedHomeWidget({
    Key key,
    @required List<BannerModel> recommendedCity,
  })  : _recommendedCity = recommendedCity,
        super(key: key);

  final List<BannerModel> _recommendedCity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _recommendedCity.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = _recommendedCity[index];
        return Container(
          margin: EdgeInsets.only(
            right: content_child_margin,
          ),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                fit: BoxFit.fill,
                width: 150,
                height: 220,
                imageUrl: item.imageUrl,
                placeholder: (context, url) => Center(
                  child: LoadingIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      formatNumberToCurrency(
                        item.averagePrice.toDouble(),
                      ),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

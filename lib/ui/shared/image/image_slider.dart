import 'package:NitipBeli/ui/shared/loading/loading_indicator.dart';
import 'package:NitipBeli/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FlexibleImageSlider extends StatelessWidget {
  const FlexibleImageSlider({
    Key key,
    @required PageController pageController,
    @required List<String> banner,
  })  : _pageController = pageController,
        _banner = banner,
        super(key: key);

  final PageController _pageController;
  final List<String> _banner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            _banner.length,
            (int index) => Container(
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: _banner[index],
                placeholder: (context, url) => Center(
                  child: LoadingIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: _banner.length,
            effect: ExpandingDotsEffect(
              activeDotColor: kColorPrimary,
              dotColor: Color(0xFFababab),
              dotHeight: 6,
              dotWidth: 6,
              spacing: 6,
            ),
          ),
        ),
      ],
    );
  }
}

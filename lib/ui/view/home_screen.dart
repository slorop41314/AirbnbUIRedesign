import 'package:NitipBeli/core/model/banner_model.dart';
import 'package:NitipBeli/data/hotel_category.dart';
import 'package:NitipBeli/data/recommended_city.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/button/secondary_button.dart';
import 'package:NitipBeli/ui/shared/card/large_banner.dart';
import 'package:NitipBeli/ui/shared/image/image_slider.dart';
import 'package:NitipBeli/ui/widget/home_recommended.dart';
import 'package:NitipBeli/ui/widget/home_tabbar_content.dart';
import 'package:NitipBeli/utils/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const route_name = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _pageController = PageController(
    viewportFraction: 1,
  );
  List<Widget> _tabs = [];
  List<Widget> _tabData = [];
  final _banner = [
    "https://press.airbnb.com/wp-content/uploads/sites/4/2019/06/OHT2.jpg?fit=800%2C600&zoom=2",
    "https://images.unsplash.com/photo-1595579112202-93e076b1f075?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1595765844793-0ce0d4c7527d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  ];

  final _recommendedCity = recommendedCity;
  final _largeBannerData = [
    BannerModel(
        imageUrl:
            "https://images.unsplash.com/photo-1498531872221-ce6d6216be71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
        name: "Fried Shrimp",
        averagePrice: 200000,
        description: "Tasty shrimp yummy"),
    BannerModel(
        imageUrl:
            "https://images.unsplash.com/photo-1595751866710-a6cb010fa20b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
        name: "Fresh Drinks",
        averagePrice: 200000,
        description: "Fresh drinks for your day"),
    BannerModel(
        imageUrl:
            "https://images.unsplash.com/photo-1595840746446-d6f858f45468?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
        name: "Burger ",
        averagePrice: 200000,
        description: "Best burger in town, go grab it"),
  ];
  final _categoryData = hotelCategoryData;

  @override
  void initState() {
    super.initState();
    _generateTabs(_categoryData.length);
    _generateWidgets();
    _tabController = TabController(length: _categoryData.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _generateTabs(length) {
    for (int i = 0; i < length; i++) {
      final title = _categoryData[i].label;
      _tabs.add(
        Container(
          padding: padding_horizontal,
          margin: EdgeInsets.only(right: content_child_margin),
          color: Colors.grey[100],
          child: Tab(
            text: title,
          ),
        ),
      );
    }
  }

  void _generateWidgets() {
    for (int i = 0; i < _categoryData.length; i++) {
      final category = _categoryData[i].value;
      _tabData.add(
        HomeTabBarContent(category: category),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              floating: false,
              snap: false,
              pinned: true,
              elevation: 0,
              title: Text("Home"),
              textTheme: Theme.of(context).textTheme,
              actionsIconTheme: IconThemeData(
                color: Colors.grey,
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.notifications,
                    ),
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: FlexibleImageSlider(
                  pageController: _pageController,
                  banner: _banner,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: content_child_margin,
                      ),
                      Padding(
                        padding: padding_horizontal,
                        child: Text(
                          "Explore a new city",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: content_child_margin,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: content_margin),
                        child: new TabBar(
                          labelPadding: EdgeInsets.zero,
                          isScrollable: true,
                          labelColor: kColorSecondary,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          unselectedLabelColor: Colors.black,
                          controller: _tabController,
                          tabs: _tabs,
                        ),
                      ),
                      SizedBox(
                        height: content_child_margin,
                      ),
                      Container(
                        height: 500,
                        padding: padding_horizontal,
                        child: TabBarView(
                          controller: _tabController,
                          children: _tabData,
                        ),
                      ),
                      SizedBox(
                        height: content_child_margin,
                      ),
                      Container(
                        margin: margin_horizontal,
                        child: SecondaryButton(
                          buttonTitle: "Show all 2000",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: content_margin,
                      ),
                      Padding(
                        padding: padding_horizontal,
                        child: Text(
                          "Recommended",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: content_margin,
                      ),
                      Container(
                        height: 220,
                        padding: EdgeInsets.only(
                          left: content_margin,
                        ),
                        child: RecommendedHomeWidget(
                          recommendedCity: _recommendedCity,
                        ),
                      ),
                      SizedBox(
                        height: content_margin,
                      ),
                      Padding(
                        padding: padding_horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Online Experiences with Chef",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              "Find a top rated home that you need",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: content_margin,
                      ),
                      Container(
                        height: 250,
                        padding: EdgeInsets.only(
                          left: content_margin,
                        ),
                        child: Container(
                          child: ListView.builder(
                            itemCount: _largeBannerData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = _largeBannerData[index];
                              return LargeBanner(item: item);
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: margin_horizontal,
                        child: SecondaryButton(
                          buttonTitle: "Explore all",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

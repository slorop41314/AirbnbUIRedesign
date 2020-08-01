import 'package:NitipBeli/data/hotel_data_city.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/image/image.dart';
import 'package:NitipBeli/ui/widget/favorite_list_content.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final _favoriteData = [
    {"city": "London", "data": hotelData["london"]},
    {"city": "Beijing", "data": hotelData["beijing"]},
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 250;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Saved",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: (230 * _favoriteData.length).toDouble(),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _favoriteData.length,
                itemBuilder: (context, index) {
                  return FavoriteListContent(data: _favoriteData[index]);
                },
              ),
            ),
            Padding(
              padding: padding_horizontal,
              child: Text(
                "Popular List",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              height: 500,
              padding: padding_horizontal,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: itemWidth / itemHeight,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        CustomImage(
                          url:
                              "https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        ),
                        Center(
                          child: Text(
                            "Qui Qui, Paris",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        CustomImage(
                          url:
                              "https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        ),
                        Center(
                          child: Text(
                            "Qui Qui, Paris",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        CustomImage(
                          url:
                              "https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        ),
                        Center(
                          child: Text(
                            "Qui Qui, Paris",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        CustomImage(
                          url:
                              "https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        ),
                        Center(
                          child: Text(
                            "Qui Qui, Paris",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

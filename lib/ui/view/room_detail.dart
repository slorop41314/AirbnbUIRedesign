import 'package:NitipBeli/core/model/hotel_model.dart';
import 'package:NitipBeli/ui/metrics.dart';
import 'package:NitipBeli/ui/shared/image/image_slider.dart';
import 'package:NitipBeli/ui/widget/room_detail_actions.dart';
import 'package:flutter/material.dart';

class RoomDetail extends StatefulWidget {
  static const route_name = "RoomDetail";
  @override
  _RoomDetailState createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  ScrollController _scrollController = new ScrollController();
  final _pageController = PageController(
    viewportFraction: 1,
  );

  Color _headerColor = Colors.white;

  _scrollListener() {
    if (isShrink) {
      setState(() {
        _headerColor = Colors.black;
      });
    } else {
      setState(() {
        _headerColor = Colors.white;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (240 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    final Hotel data = args["data"];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 250,
                    floating: false,
                    snap: false,
                    pinned: true,
                    elevation: 0,
                    title: Text(
                      data.name,
                      style: TextStyle(
                        color: _headerColor,
                      ),
                    ),
                    iconTheme: IconThemeData(
                      color: _headerColor,
                    ),
                    actionsIconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    actions: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.notifications,
                            color: _headerColor,
                          ),
                        ),
                      )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: FlexibleImageSlider(
                        pageController: _pageController,
                        banner: data.imageUrl,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          padding: padding_container,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Description",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis, mi a feugiat aliquam, augue turpis pulvinar risus, vitae sagittis lectus ex eu ligula. Mauris imperdiet felis a velit varius condimentum fringilla quis arcu.",
                              ),
                              SizedBox(
                                height: content_child_margin,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.people),
                                      SizedBox(
                                        width: content_small_margin,
                                      ),
                                      Text("6"),
                                      Text("Guest"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.airline_seat_individual_suite),
                                      SizedBox(
                                        width: content_small_margin,
                                      ),
                                      Text("3"),
                                      Text("beds"),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.room),
                                      SizedBox(
                                        width: content_small_margin,
                                      ),
                                      Text("3"),
                                      Text("bedroom"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.accessible_forward),
                                      SizedBox(
                                        width: content_small_margin,
                                      ),
                                      Text("2"),
                                      Text("bath"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: padding_child,
              child: RoomDetailActions(data: data),
            ),
          ],
        ),
      ),
    );
  }
}

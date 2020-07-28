import 'package:NitipBeli/core/service/localdata_service.dart';
import 'package:NitipBeli/data/onboarding_data.dart';
import 'package:NitipBeli/ui/shared/button/primary_button.dart';
import 'package:NitipBeli/ui/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnBoardingScreen extends StatelessWidget {
  //Route Name
  static const route_name = "OnBoardingScreen";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            // height: MediaQuery.of(context).size.height - 150,
            child: Swiper(
              loop: false,
              itemBuilder: (BuildContext context, int index) {
                final data = onBoardingData[index];
                return Container(
                  height: double.infinity - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   introData[index]["image"],
                      //   height: 250,
                      // ),
                      Icon(
                        data["icon"],
                        size: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                data["title"],
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            Text(
                              data["desc"],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: onBoardingData.length,
              pagination: new SwiperPagination(
                // margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                builder: new DotSwiperPaginationBuilder(
                  color: Theme.of(context).hintColor,
                  activeColor: Theme.of(context).accentColor,
                  size: 8.0,
                  activeSize: 8.0,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(5),
            child: PrimaryButton(
              buttonTitle: "Lewati",
              onTap: () {
                LocalService.shared.changeInitialOpenStatus(false);
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.route_name);
              },
            ),
          ),
        ],
      ),
    ));
  }
}

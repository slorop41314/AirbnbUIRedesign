import 'dart:async';

import 'package:NitipBeli/core/service/localdata_service.dart';
import 'package:NitipBeli/ui/view/bottom_nav_bar.dart';
import 'package:NitipBeli/ui/view/login_screen.dart';
import 'package:NitipBeli/ui/view/onboarding_screen.dart';
import 'package:NitipBeli/utils/image_path.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const route_name = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    final bool initialOpenStatus = await LocalService.shared.isInitialOpened();
    final bool isUserLoggedIn = await LocalService.shared.isUserLoggedIn();
    Timer(
        Duration(seconds: 1),
        () => {
              if (isUserLoggedIn)
                {
                  Navigator.of(context)
                      .pushReplacementNamed(BottomTabNav.route_name),
                }
              else
                {
                  if (initialOpenStatus)
                    {
                      Navigator.of(context)
                          .pushReplacementNamed(OnBoardingScreen.route_name)
                    }
                  else
                    {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.route_name)
                    }
                },
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            logo_image_path,
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}

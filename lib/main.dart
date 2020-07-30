import 'package:NitipBeli/ui/theme.dart';
import 'package:NitipBeli/ui/view/bottom_nav_bar.dart';
import 'package:NitipBeli/ui/view/login_screen.dart';
import 'package:NitipBeli/ui/view/onboarding_screen.dart';
import 'package:NitipBeli/ui/view/room_detail.dart';
import 'package:NitipBeli/ui/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(
//           value: UserProvider(),
//         ),
//         ChangeNotifierProvider.value(
//           value: ProductsProvider(),
//         ),
//         ChangeNotifierProvider.value(
//           value: BestSellerProductsProvider(),
//         ),
//         ChangeNotifierProvider.value(
//           value: SearchProvider(),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airbnb UI Redesign',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: {
        "/": (context) => SplashScreen(),

        // Registration Screen
        OnBoardingScreen.route_name: (context) => OnBoardingScreen(),
        LoginScreen.route_name: (context) => LoginScreen(),

        // Auth Screen
        BottomTabNav.route_name: (context) => BottomTabNav(),
        RoomDetail.route_name: (context) => RoomDetail(),
      },
    );
  }
}

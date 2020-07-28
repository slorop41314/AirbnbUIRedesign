import 'package:NitipBeli/ui/view/explore_screen.dart';
import 'package:NitipBeli/ui/view/favorite_screen.dart';
import 'package:NitipBeli/ui/view/home_screen.dart';
import 'package:NitipBeli/ui/view/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomTabNav extends StatefulWidget {
  static const route_name = "BottomTabNav";
  BottomTabNav({Key key}) : super(key: key);

  @override
  _BottomTabNavState createState() => _BottomTabNavState();
}

class _BottomTabNavState extends State<BottomTabNav> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    HomeScreen(),
    ExploreScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text('Liked'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text('Profile'),
          ),
        ],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

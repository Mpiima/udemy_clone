import 'package:flutter/material.dart';
import 'package:udemy_clone/Screens/HomeScreens/Featured/Featured.dart';
import 'package:udemy_clone/Screens/HomeScreens/MyCourses/MyCourses.dart';
import 'package:udemy_clone/Screens/HomeScreens/Search.dart';
import 'package:udemy_clone/Screens/HomeScreens/Wishlist.dart';
import 'package:udemy_clone/Screens/HomeScreens/Account.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _screens = [Featured(), Search(), MyCourses(), Wishlist(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    )))
                .values
                .toList()),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) => setState(() {
                _selectedIndex = i;
              }),
          backgroundColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.lightBlueAccent),
          unselectedIconTheme: IconThemeData(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
          iconSize: 26.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border),
                activeIcon: Icon(Icons.star),
                label: 'Featured'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline),
                activeIcon: Icon(Icons.play_circle_rounded),
                label: 'My learning'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle_rounded),
                label: 'Account'),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/features/buddies.dart';
import 'package:flutter_laravel_auth/features/discover.dart';
import 'package:flutter_laravel_auth/features/profile/screens/profile.dart';
import 'package:flutter_laravel_auth/features/settings/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const routeName = '/tab-screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>> _screens = [
    {'page': ProfileScreen()},
    {'page': Buddies()},
    {'page': Discover()},
    {
      'page': SettingsScreen(),
    },
  ];
  int _selectIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.get('email'));
    print(pref.get('password'));
  }

  @override
  Widget build(BuildContext context) {
    getValue();
//    n@n.com
//  123456789
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom,
        child: _screens[_selectIndex]['page'],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          onTap: _selectScreen,
          currentIndex: _selectIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gesture_sharp),
              label: 'Buddies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    );
  }
}

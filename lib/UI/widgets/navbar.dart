import 'package:flutter/material.dart';

import 'package:clash_of_codes/UI/screens/home.dart';
import 'package:clash_of_codes/UI/screens/profile.dart';
import 'package:clash_of_codes/UI/screens/session.dart';

import '../../constants/colors.dart';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      margin: EdgeInsets.only(left: 10, right: 10),
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      dotIndicatorColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      onTap: _handleIndexChanged,
      items: [
        /// Sessions
        DotNavigationBarItem(
          icon: Icon(Icons.chat),
          selectedColor: black,
        ),

        /// Home
        DotNavigationBarItem(
          icon: Icon(Icons.home),
          selectedColor: black,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: Icon(Icons.person),
          selectedColor: black,
        ),
      ],
    );
  }
}

enum _SelectedTab { session, home, person }

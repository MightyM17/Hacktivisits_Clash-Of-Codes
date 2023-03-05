import 'package:clash_of_codes/UI/screens/chat.dart';
import 'package:flutter/material.dart';

import 'package:clash_of_codes/UI/screens/home.dart';
import 'package:clash_of_codes/UI/screens/profile.dart';
import 'package:clash_of_codes/UI/screens/session.dart';

import '../../constants/colors.dart';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  //const BottomNavBar({super.key});

  var iindex;
  BottomNavBar({
    iindex
  }): this.iindex = iindex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState(iindex);
}

class _BottomNavBarState extends State<BottomNavBar> {
  Widget? _child;
  _BottomNavBarState(this._index);
  var _index;

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = MyHomePage();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (builder) => SessionPage()));
          print("Chat");
          break;
        case 1:
          _child = HomePage();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (builder) => HomePage()));
          print("Home");
          break;
        case 2:
          _child = ProfilePage();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (builder) => ProfilePage()));
          print("Profile");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      icons: [
        FluidNavBarIcon(
            icon: Icons.chat,
            backgroundColor: Color(0xFF4285F4),
            extras: {"label": "session"}),
        FluidNavBarIcon(
            icon: Icons.home,
            backgroundColor: Color(0xFFEC4134),
            extras: {"label": "home"}),
        FluidNavBarIcon(
            icon: Icons.person,
            backgroundColor: Color(0xFFFCBA02),
            extras: {"label": "profile"}),
      ],
      defaultIndex: _index,
      onChange: _handleNavigationChange,
      style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
      scaleFactor: 1.5,
      itemBuilder: (icon, item) =>
          Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
    );
  }
}

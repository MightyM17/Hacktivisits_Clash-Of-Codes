import 'package:flutter/material.dart';

import 'package:clash_of_codes/UI/screens/home.dart';
import 'package:clash_of_codes/UI/screens/profile.dart';
import 'package:clash_of_codes/UI/screens/session.dart';

import '../../constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.chat_outlined),
          label: "Session",
        ),
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outlined),
          label: "Profile",
        ),
      ],
    );
  }
}
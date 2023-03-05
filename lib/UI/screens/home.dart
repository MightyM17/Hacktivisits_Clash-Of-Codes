import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:clash_of_codes/UI/widgets/navbar.dart';
import 'package:clash_of_codes/constants/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:clash_of_codes/UI/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//import 'package:clash_of_codes/realtime/managedb.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import 'dart:developer';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late DatabaseReference _dbref;
  String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
  var bookslist = '';
  var favlist = '';

  @override
  void initState() {
    // _loadCards();
    super.initState();
    _dbref = FirebaseDatabase(
            databaseURL:
                "https://library-task-default-rtdb.asia-southeast1.firebasedatabase.app/")
        .ref();
  }

  int counter = 4;

  @override
  Widget build(BuildContext context) {
    String uid = (FirebaseAuth.instance.currentUser?.uid).toString();

    // card controller
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    // List of images
    List<Stack> match_cards = [
      spark_card(context,
          'https://images.unsplash.com/photo-1508341591423-4347099e1f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'),
      spark_card(context,
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVhdXRpZnVsJTIwd29tZW58ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),
      spark_card(context,
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmVhdXRpZnVsJTIwbWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
              text: 'Hey, ',
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: 'Het',
                    style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )),
              ]),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar1.png'),
            backgroundColor: Colors.grey,
            radius: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignInScreen()));
              });
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            items: match_cards,
            onCardSwiped: (dir, index, widget) {
              // adding the next card
              if (counter <= 20) {
                _cardController.addItem(spark_card(context,
                    "https://images.unsplash.com/photo-1583147610149-78ac5cb5a303?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"));
                counter++;
              }

              if (dir == Direction.left) {
                print('disliked');
              } else if (dir == Direction.right) {
                print('liked');
              }
            },
            enableSwipeUp: false,
            enableSwipeDown: false,
          ),
        ],
      ),
      // extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: BottomNavBar(),
      ),
    );
  }
}

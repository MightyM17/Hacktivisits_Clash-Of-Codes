import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:clash_of_codes/UI/widgets/navbar.dart';
import 'package:clash_of_codes/constants/colors.dart';
import 'package:clash_of_codes/firestore/managedb.dart';
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
import 'package:http/http.dart' as http;
import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:clash_of_codes/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class DataRequiredForBuild {
  String username;
  var pref;
  DataRequiredForBuild({required this.username,required this.pref});
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
  var options = [];
  String name='Smit';
  late String newname = "def";
  int counter = 4;
  var pref = [];

  void _fetchAllData(String id) async {
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    name = ds['name'];
    pref = ds['pref'];
  }

  void listNames(String id) async {
    FirebaseFirestore.instance.collection("users").doc(id).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print("HIIIIIIIIIII");
      print(data['name']);
      // data['name'];
    },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  void getPref(String id) async {
    FirebaseFirestore.instance.collection("users").doc(id).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      setState(() {
        pref = data['pref'];
      });
    },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  void addToLiked(String id) async {
    FirebaseFirestore.instance.collection("users").doc(id).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data['likes']);
      var li = data['likes'];
      li.add(id);
      FirebaseFirestore.instance.collection('users').doc(id).update({'likes': li});
    },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  void getOptions(String pref) async{
    String url = 'http://10.0.2.2:5000/api?pref='+pref;
    var response = await http.get(Uri.parse(url),);
    print(response.body);
    /*setState(() {
      options = [97 ,20, 24 ,77 ,96 ,66 ,28, 8, 98, 84, 13, 21, 85, 52, 50, 40, 76,26,11,93];
    });*/
  }


  @override
  void initState() {

    String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
    print(uid);
    _fetchAllData(uid);
    getPref(uid);
    print(pref.join(', '));
    getOptions(pref.join(', '));
    print(options);
    //listNames(options[1].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // card controller
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    List<String> aboutme = [
      "Hi there! I'm a fitness enthusiast from the West Coast of the United States. In my free time, I enjoy hiking, running, and practicing yoga.",
      "Welcome to my page! I'm a software engineer in my 30s living in the Pacific Northwest. When I'm not working, I love to play video games or read sci-fi novels.",
      "Hey, I'm a teacher in my mid-20s from a major Canadian city. My passion is traveling and I enjoy sharing my experiences with others through my blog.",
      "Greetings! I'm a graphic designer based in a bustling European city. In my spare time, I enjoy exploring the local museums and art galleries and practicing my photography skills.",
      "Nice to meet you! I'm a 28-year-old chef from a vibrant Spanish city. I love experimenting with new recipes and ingredients in the kitchen and sharing my creations with friends and family.",
      "Hi there! I'm a fitness enthusiast from the West Coast of the United States. In my free time, I enjoy hiking, running, and practicing yoga.",
      "Welcome to my page! I'm a software engineer in my 30s living in the Pacific Northwest. When I'm not working, I love to play video games or read sci-fi novels.",
      "Hey, I'm a teacher in my mid-20s from a major Canadian city. My passion is traveling and I enjoy sharing my experiences with others through my blog.",
      "Greetings! I'm a graphic designer based in a bustling European city. In my spare time, I enjoy exploring the local museums and art galleries and practicing my photography skills.",
      "Nice to meet you! I'm a 28-year-old chef from a vibrant Spanish city. I love experimenting with new recipes and ingredients in the kitchen and sharing my creations with friends and family.",
      "Hi there! I'm a fitness enthusiast from the West Coast of the United States. In my free time, I enjoy hiking, running, and practicing yoga.",
      "Welcome to my page! I'm a software engineer in my 30s living in the Pacific Northwest. When I'm not working, I love to play video games or read sci-fi novels.",
      "Hey, I'm a teacher in my mid-20s from a major Canadian city. My passion is traveling and I enjoy sharing my experiences with others through my blog.",
      "Greetings! I'm a graphic designer based in a bustling European city. In my spare time, I enjoy exploring the local museums and art galleries and practicing my photography skills.",
      "Nice to meet you! I'm a 28-year-old chef from a vibrant Spanish city. I love experimenting with new recipes and ingredients in the kitchen and sharing my creations with friends and family.",
      "Hi there! I'm a fitness enthusiast from the West Coast of the United States. In my free time, I enjoy hiking, running, and practicing yoga.",
      "Welcome to my page! I'm a software engineer in my 30s living in the Pacific Northwest. When I'm not working, I love to play video games or read sci-fi novels.",
      "Hey, I'm a teacher in my mid-20s from a major Canadian city. My passion is traveling and I enjoy sharing my experiences with others through my blog.",
      "Greetings! I'm a graphic designer based in a bustling European city. In my spare time, I enjoy exploring the local museums and art galleries and practicing my photography skills.",
      "Nice to meet you! I'm a 28-year-old chef from a vibrant Spanish city. I love experimenting with new recipes and ingredients in the kitchen and sharing my creations with friends and family.",
    ];

    // List of images
    List<Stack> match_cards = [
      spark_card(context,
          'https://images.unsplash.com/photo-1508341591423-4347099e1f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
          "Jackson", aboutme[0]),
      spark_card(context,
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVhdXRpZnVsJTIwd29tZW58ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
          "Ella", aboutme[1]),
      spark_card(context,
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmVhdXRpZnVsJTIwbWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
          "Luke", aboutme[2]),
    ];

    return Scaffold(
      key: ValueKey<int>(1),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
              text: 'Hey ',
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: name,
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
              //listNames(options[1].toString());
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
                //_fetchAllData(options[index].toString());
                _cardController.addItem(spark_card(context,
                    "https://images.unsplash.com/photo-1583147610149-78ac5cb5a303?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    "Serena", aboutme[counter]));
                counter++;
              }

              if (dir == Direction.left) {
                print('disliked');
              } else if (dir == Direction.right) {
                //addToLiked(options[index].toString());
                print('liked');
              }
            },
            enableSwipeUp: false,
            enableSwipeDown: false,
          ),
        ],
      ),
      // extendBody: true,
      bottomNavigationBar: BottomNavBar(iindex: 1,),
    );
  }
}

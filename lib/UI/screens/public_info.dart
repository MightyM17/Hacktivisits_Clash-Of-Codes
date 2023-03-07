import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../util/reuuse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PublicInfoPage extends StatefulWidget {
  const PublicInfoPage({super.key});

  @override
  State<PublicInfoPage> createState() => _PublicInfoPageState();
}

class _PublicInfoPageState extends State<PublicInfoPage> {
  TextEditingController _nickname = TextEditingController();
  TextEditingController _aboutMe = TextEditingController();
  var pref;

  List<String> myInterests = [''];
  String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Public Profile',
          style: GoogleFonts.lato(
            color: black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              inputText('Nickname 👻', 'Lorem ipsum', _nickname, false),
              inputText('About Me 🗿', 'Mein apni favourite hu', _aboutMe, false),
              SizedBox(height: 20),
              Text(
                'My Interests 🙈',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 10),
              displayInterests(
                  context, 'Education', ['bachelors', 'masters', 'phd'], [0,1,2]),
              displayInterests(context, 'Food',
                  ['continental', 'indian', 'chinese', 'italian'], [3,4,5,6]),
              displayInterests(context, 'Music', ['Rock', 'Jazz', 'EDM', 'Pop'], [7,8,9,10]),
              displayInterests(
                  context, 'Gaming', ['Minecraft', 'Valorant', 'Fortnite'], [11,12,13]),
              displayInterests(
                  context, 'Shows', ['Friends', 'B99', 'GoT', 'Suits'], [14,15,16,17]),
              displayInterests(context, 'Date preference',
                  ['Picnic', 'Walk', 'Dance', 'Hike'], [18,19,20,21]),
              displayInterests(context, 'Other interests', [
                'astrology',
                'fashion',
                'gym',
                'pets',
                'politics',
                'science',
                'tech',
                'writing'
              ], [22,23,24,25,26,27,28,29]),
            ],
          ),
        ),
      ),
    );
  }
}

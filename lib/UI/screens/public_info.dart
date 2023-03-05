import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../util/reuuse.dart';

class PublicInfoPage extends StatefulWidget {
  const PublicInfoPage({super.key});

  @override
  State<PublicInfoPage> createState() => _PublicInfoPageState();
}

class _PublicInfoPageState extends State<PublicInfoPage> {
  TextEditingController _nickname = TextEditingController();
  TextEditingController _aboutMe = TextEditingController();

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
                  context, 'Education', ['bachelors', 'masters', 'phd']),
              displayInterests(context, 'Food',
                  ['continental', 'indian', 'chinese', 'italian']),
              displayInterests(context, 'Music', ['Rock', 'Jazz', 'EDM', 'Pop']),
              displayInterests(
                  context, 'Gaming', ['Minecraft', 'Valorant', 'Fortnite']),
              displayInterests(
                  context, 'Shows', ['Friends', 'B99', 'GoT', 'Suits']),
              displayInterests(context, 'Date preference',
                  ['Picnic', 'Walk', 'Dance', 'Hike']),
              displayInterests(context, 'Other interests', [
                'astrology',
                'fashion',
                'gym',
                'pets',
                'politics',
                'science',
                'tech',
                'writing'
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

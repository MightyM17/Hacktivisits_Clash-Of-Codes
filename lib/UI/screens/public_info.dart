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

  List<String> myInterests = [''];
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
            ListView.builder(
              itemBuilder: (context, index) {},
            ),
          ],
        ),
      ),
    );
  }
}

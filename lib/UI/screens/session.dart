import 'package:clash_of_codes/UI/screens/chat.dart';
import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:clash_of_codes/UI/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Sessions',
          style: GoogleFonts.lato(
            color: black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // ongoing sessions heading
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Text(
                'Ongoing Session',
                style: GoogleFonts.lato(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            // ongoing session card
            session_tile(context, 'Jackson', '10 hours'),

            SizedBox(height: 30),

            // successful session heading
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Text(
                'Successful Sessions',
                style: GoogleFonts.lato(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            // successful session cards

            session_tile(context, 'Mike', '24 hours'),
            SizedBox(height: 10),
            session_tile(context, 'Jake', '24 hours'),
            SizedBox(height: 10),
            session_tile(context, 'Scarlet', '24 hours'),

            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(iindex: 0),
    );
  }
}

import 'package:clash_of_codes/UI/screens/private_info.dart';
import 'package:clash_of_codes/UI/screens/public_info.dart';
import 'package:clash_of_codes/UI/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:clash_of_codes/UI/widgets/navbar.dart';
import '../../constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey<int>(3),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: blue,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 100),
                    bottomRight: Radius.elliptical(200, 100),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 150,
              ),
              Positioned(
                bottom: -50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar1.png'),
                  radius: 70,
                ),
              )
            ],
          ),
          SizedBox(height: (10 + 50)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // info heading
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(
                      'Info',
                      style: GoogleFonts.lato(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // info card
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => PublicInfoPage()));
                          },
                          title: Text(
                            'Public info',
                            style: GoogleFonts.lato(color: Colors.grey[600]),
                          ),
                          trailing: Icon(
                            Icons.visibility_rounded,
                            color: Colors.grey[500],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(color: Colors.grey[400]),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => PrivateInfoPage()));
                          },
                          title: Text(
                            'Private info',
                            style: GoogleFonts.lato(color: Colors.grey[600]),
                          ),
                          trailing: Icon(
                            Icons.visibility_off_rounded,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // settings heading
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(
                      'Settings',
                      style: GoogleFonts.lato(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // settings card
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Notifications',
                            style: GoogleFonts.lato(color: Colors.grey[600]),
                          ),
                          trailing: Icon(
                            Icons.notifications,
                            color: Colors.grey[500],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(color: Colors.grey[400]),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Account',
                            style: GoogleFonts.lato(color: Colors.grey[600]),
                          ),
                          trailing: Icon(
                            Icons.person_2,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        iindex: 2,
      ),
    );
  }
}

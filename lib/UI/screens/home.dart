import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:clash_of_codes/UI/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:clash_of_codes/realtime/managedb.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseReference _dbref;
  String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
  var bookslist = '';
  var favlist = '';

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase(databaseURL: "https://library-task-default-rtdb.asia-southeast1.firebasedatabase.app/").ref();
  }

  @override
  Widget build(BuildContext context) {
    String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed out");
              Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SignInScreen()));
            });
          },
        ),
        ],
      ),
    );
  }
}


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:clash_of_codes/models/model.dart';
//import 'package:clash_of_codes/realtime/managedb.dart';
import 'package:clash_of_codes/UI/screens/signin.dart';
import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:clash_of_codes/UI/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  var _error = '';
  late FirebaseDatabase _fbref;
  var user = FirebaseAuth.instance.currentUser;

  List<Person> personList = [];

  @override
  void initState() {
    super.initState();
    _fbref = FirebaseDatabase(
        databaseURL:
            "https://library-task-default-rtdb.asia-southeast1.firebasedatabase.app/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // logo
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 48, 0),
                  child: Image.asset('assets/spark logo rect.png'),
                ),
                SizedBox(height: 60),

                // inputText('Name', 'eg: Het Nakhua', controller, obscT),
                inputText('Email', 'eg: hetnakhua@gmail.com', _email, false),
                inputText('Password', 'eg: #het493', _pass, true),

                SizedBox(
                  height: 40,
                ),

                singInUp(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _email.text,
                    password: _pass.text,
                  )
                      .then((value) {
                    setState(() => _error = 'Signed Up Successfully');
                    String uid =
                        (FirebaseAuth.instance.currentUser?.uid).toString();
                    print(_error);
                    //createDB(_fbref.ref("Users/$uid"));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => HomePage()));
                  }).onError((error, stackTrace) {
                    setState(() => _error = error.toString());
                    print(_error);
                  });
                }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                signIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: Text(
            "Login!",
            style: TextStyle(color: blue),
          ),
        ),
      ],
    );
  }
}

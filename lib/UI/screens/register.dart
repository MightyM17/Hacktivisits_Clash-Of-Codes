import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:clash_of_codes/models/model.dart';
import 'package:clash_of_codes/firestore/managedb.dart';
import 'package:clash_of_codes/UI/screens/signin.dart';
import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:clash_of_codes/UI/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _mob = TextEditingController();
  TextEditingController _cpass = TextEditingController();
  var _error = '';
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30,),
              inputText('Name', Icons.person, false, _name),
              SizedBox(height: 20,),
              inputText('Email', Icons.email_outlined, false, _email),
              SizedBox(height: 20,),
              TextField(
                  controller: _mob,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  labelText: 'Mobile Number',
                  filled: true,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20,),
              inputText('Password', Icons.password, true, _pass),
              SizedBox(height: 20,),
              inputText('Confirm Password', Icons.password_outlined, true, _cpass),
              SizedBox(height: 20,),
              singInUp(context, false, () {
                if(_pass.text == _cpass.text)
                  {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text,
                      password: _pass.text,
                    ).then((value) {
                      setState(() => _error = 'Signed Up Successfully');
                      String uid = (FirebaseAuth.instance.currentUser?.uid).toString();
                      print(_error);
                      addUser(uid, _name.text, _email.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => HomePage()));
                    }).onError((error, stackTrace) {
                      setState(() => _error = error.toString().substring(error.toString().indexOf('] ')+2).toString());
                      print(error.toString());
                    });
                  }
                else
                  {
                    setState(() => _error = 'Passwords dont match');
                  }
              }),
              SizedBox(height: 20,),
              Text(
                _error,
                style: TextStyle(color: Colors.red,),
              ),
              SizedBox(height: 20,),
              signIn(),
            ],
          ),
        ),
      ),
    );
  }

  Row signIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ",
          style: TextStyle(color: Colors.black),),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: Text("Sign In!",
            style: TextStyle(color: Colors.blue),),
        ),
      ],
    );
  }
}

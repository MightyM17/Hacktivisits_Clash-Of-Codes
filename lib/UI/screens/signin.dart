import 'package:flutter/material.dart';
import 'package:clash_of_codes/UI/screens/home.dart';
import 'package:clash_of_codes/UI/screens/register.dart';
import 'package:clash_of_codes/UI/util/reuuse.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  var _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30,),
              inputText('Email', Icons.person_outline, false, _email),
              SizedBox(height: 20,),
              inputText('Password', Icons.person_outline, true, _pass),
              SizedBox(height: 20,),
              singInUp(context, true, () {
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _pass.text).then((value)
                {
                  setState(() => _error = 'Signed In Successfully');
                  print(_error);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => HomePage()));
                }).onError((error, stackTrace){
                  /*
                    if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                   */
                  setState(() => _error = error.toString());
                  print(_error);
                });
              }),
              SizedBox(height: 20,),
              Text(
                _error,
                style: TextStyle(color: Colors.red,),
              ),
              SizedBox(height: 20,),
              signUp(),
            ],
          ),
        ),
      ),
    );
  }

  Row signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Do not have an account? ",
          style: TextStyle(color: Colors.black),),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text("Register!",
            style: TextStyle(color: Colors.blue),),
        ),
      ],
    );
  }
}
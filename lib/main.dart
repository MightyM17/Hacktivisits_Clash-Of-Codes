import 'package:clash_of_codes/UI/screens/profile.dart';
import 'package:clash_of_codes/UI/screens/session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseapp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return MaterialApp(
        title: 'Spark',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const OnboardingScreen(),
          '/session': (context) => const SessionPage(),
          '/profile': (context) => const ProfilePage(),
        },
      );
    } else {
      return MaterialApp(
        title: 'Spark',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const OnboardingScreen(),
          '/session': (context) => const SessionPage(),
          '/profile': (context) => const ProfilePage(),
        },
      );
  }
}

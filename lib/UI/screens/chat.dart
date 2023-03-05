import 'dart:convert';
import 'dart:math';
import 'package:clash_of_codes/UI/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'Q8aeT9zodMVEl4oWvpga4IKQ4mq2');
  var questions = [
    "What's the most interesting thing about your day so far?",
    "Do you have any hobbies or passions that you'd like to share?",
    "What's your favorite type of music?",
    "What's the last book you read?",
    "What's your favorite type of food?",
    "Do you have any pets?",
    "What's the best vacation you've ever taken?",
    "Do you have any siblings? If so, where do you fall in the birth order?",
    "What's your favorite movie or TV show?",
    "Have you traveled anywhere interesting recently?",
    "What's your favorite sport or athletic activity?",
    "Do you enjoy trying new things? If so, what's something you'd like to try?",
    "What's the most important quality in a partner for you?",
    "What's your favorite season?",
    "Do you have any favorite jokes or funny stories?",
    "What's something you're really good at?",
    "Do you prefer coffee or tea?",
    "What's your favorite type of dessert?",
    "What's your favorite type of art?",
    "Do you have any favorite quotes or sayings?",
    "What's your favorite way to spend a lazy day?",
    "What's your favorite childhood memory?",
    "What's your favorite board game?",
    "What's your favorite outdoor activity?",
    "What's the most adventurous thing you've ever done?",
    "What's your favorite way to exercise?",
    "What's something you've always wanted to learn how to do?",
    "Do you have any favorite podcasts?",
    "What's your favorite way to unwind after a long day?",
    "What's your favorite thing to do with your friends?",
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        key: ValueKey<int>(0),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF4285F4),
          title: Text(
            'Chat',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.report_gmailerrorred,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final _random = new Random();
                var element = questions[_random.nextInt(questions.length)];
                icebreaker(element);
              },
              child: Text("Want some icebreakers?"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4285F4),
                elevation: 0,
              ),
            ),
            Expanded(
              child: Chat(
                messages: _messages,
                onSendPressed: _handleSendPressed,
                user: _user,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          iindex: 0,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  void icebreaker(String message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message,
    );
    _addMessage(textMessage);
  }
}

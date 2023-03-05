import 'package:flutter/material.dart';

class PrivateInfoPage extends StatefulWidget {
  const PrivateInfoPage({super.key});

  @override
  State<PrivateInfoPage> createState() => _PrivateInfoPageState();
}

class _PrivateInfoPageState extends State<PrivateInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Private Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

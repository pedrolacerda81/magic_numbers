import 'package:flutter/material.dart';

class MagicNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text('Magic Numbers', style: TextStyle(color: Colors.white)),
      ),
      body: Container(),
    );
  }
}

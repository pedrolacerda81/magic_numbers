import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic Numbers'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //TODO: reset the game...
              Navigator.pushReplacementNamed(context, '/magic-numbers');
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

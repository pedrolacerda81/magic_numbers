import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
        title: Text('Sobre', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.deepPurpleAccent,
                            Colors.deepPurple
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 110.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/profile-pic.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

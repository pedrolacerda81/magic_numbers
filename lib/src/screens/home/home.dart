import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Container _buildHomeButton(String title, Color color, Color splashColor,
      Color titleColor, Function onPressed) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            splashColor: splashColor,
            color: color,
            child: Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 16.0,
              ),
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/hat.png',
                    height: 95.0,
                    width: 95.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Magic Numbers',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RugeBoogie',
                      fontSize: 45.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  _buildHomeButton(
                      'SOBRE', Colors.redAccent, Colors.white, Colors.white,
                      () {
                    Navigator.pushNamed(context, '/about');
                  }),
                  _buildHomeButton(
                      'JOGAR!',
                      Colors.white,
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor, () {
                    Navigator.pushNamed(context, '/magic-numbers');
                  }),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dev with ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                        Text(
                          ' by Pedro Lacerda',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

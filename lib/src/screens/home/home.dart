import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple]),
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
                    height: 100.0,
                    width: 100.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Magic Numbers',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RugeBoogie',
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    splashColor: Theme.of(context).primaryColor,
                    color: Colors.white,
                    child: Text('JOGAR!',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/magic-numbers');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

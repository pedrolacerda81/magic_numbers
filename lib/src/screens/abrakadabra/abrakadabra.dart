import 'package:flutter/material.dart';
import 'package:magic_numbers/src/widgets/widgets.dart';

class Abrakadabra extends StatelessWidget {
  Abrakadabra({@required this.result});
  final int result;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    'Abrakadabra',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RugeBoogie',
                      fontSize: 45.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    result == 0 ? 'Hm...' : result.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RugeBoogie',
                      fontSize: 80.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    result == 0
                        ? 'Acho que você não escolheu número algum.'
                        : 'É o seu número!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            MagicNumbersButton(
              title: 'DEMAIS!',
              color: Colors.white,
              titleColor: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}

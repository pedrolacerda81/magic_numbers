import 'package:flutter/material.dart';

class MagicNumbers extends StatelessWidget {
  Text _bioText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.0, color: Colors.grey),
      textAlign: TextAlign.justify,
    );
  }

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
        title: Text('Magic Numbers', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'O Jogo',
                style: TextStyle(
                  fontFamily: 'RugeBoogie',
                  fontSize: 42.0,
                  letterSpacing: 1.5,
                  color: Colors.deepPurple[900],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _bioText(
                      'Serão apresentados diversos números em uma tabela e você deve memorizar apenas um deles.'),
                  SizedBox(height: 13.0),
                  _bioText(
                      'Em seguida, aparecerão outros números em outras tabelas e você deverá responder se o número que foi memorizado está presente.'),
                  SizedBox(
                    height: 13.0,
                  ),
                  _bioText('E é ai que tudo acontece...')
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    splashColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                    child: Text(
                      'VAMOS LÁ!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/play');
                    },
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

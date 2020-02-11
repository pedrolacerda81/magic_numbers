import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  final bool memorizedNumber = false;
  final String text = 'Memorize um número';
  //final String text = 'Seu número está aqui?';
  final List<List<int>> card = [
    [01, 03, 05, 07],
    [09, 11, 13, 15],
    [17, 19, 21, 23],
    [25, 27, 29, 31],
    [33, 35, 37, 39],
    [41, 43, 45, 47],
    [49, 51, 53, 55],
    [57, 59, 61, 63]
  ];
  // final List<List<int>> card = [
  //   [02, 03, 06, 07],
  //   [10, 11, 14, 15],
  //   [18, 19, 22, 23],
  //   [26, 27, 30, 31],
  //   [34, 35, 38, 39],
  //   [42, 43, 46, 47],
  //   [50, 51, 54, 55],
  //   [58, 59, 62, 63]
  // ];

  Container getRow(List<int> row) {
    List<Widget> rowChildrens = [];
    row.forEach(
      (num) {
        rowChildrens.add(
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              num.toString(),
              style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 0.5,
                color: Colors.deepPurple[900],
              ),
            ),
          ),
        );
      },
    );
    //TODO: remenber to random the numbers on the row
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowChildrens,
      ),
    );
  }

  List<Container> getRows(List<List<int>> card) {
    List<Container> rows = [];
    card.forEach((row) {
      rows.add(getRow(row));
    });
    //TODO: remenber to random the rows on the rows list
    return rows;
  }

  Container _buildPlayButtons(
      String text, IconData icon, Color color, Function onPressed) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        splashColor: Colors.white,
        color: color,
        child: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            SizedBox(width: 5.0),
            Icon(
              icon,
              size: 16.0,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }

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
              //TODO: reset the game and change the Navigation to Play...
              Navigator.pushReplacementNamed(context, '/magic-numbers');
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                text,
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
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
                  ),
                ),
                child: Column(
                  children: getRows(card),
                ),
              ),
            ),
            !memorizedNumber
                ? Container(
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
                            'OK!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          onPressed: () {
                            //TODO: onPressed
                          },
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildPlayButtons(
                            'SIM', Icons.check, Colors.deepPurpleAccent, () {}),
                        _buildPlayButtons('NÃO', Icons.close, Colors.redAccent,
                            () {
                          Navigator.popAndPushNamed(context, '/abrakadabra');
                        }),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

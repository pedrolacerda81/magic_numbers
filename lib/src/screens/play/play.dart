import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  final String text = 'Memorize um número';
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

  TableRow getRow(List<int> row) {
    List<Text> rowChildrens = [];

    row.forEach((num) {
      rowChildrens.add(Text(num.toString()));
    });

    return TableRow(
      children: rowChildrens,
    );
  }

  List<TableRow> getRows(List<List<int>> card) {
    List<TableRow> rows = [];
    card.forEach((row) {
      rows.add(getRow(row));
    });
    return rows;
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
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              child: Table(
                children: getRows(card),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

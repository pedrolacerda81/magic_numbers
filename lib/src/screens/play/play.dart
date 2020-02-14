import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_numbers/src/bloc/bloc.dart';
import 'package:magic_numbers/src/widgets/widgets.dart';

class Play extends StatelessWidget {
  final bool memorizedNumber = false;
  final String text = 'Memorize um número';

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

  Container _buildCard(List<int> card) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: card.map((num) {
          return CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              num.toString(),
              style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 0.5,
                color: Colors.deepPurple[900],
              ),
            ),
          );
        }).toList(),
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
              //TODO: reset the game...
              Navigator.pushReplacementNamed(context, '/play');
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
                child: BlocBuilder<MagicNumbersBloc, MagicNumbersState>(
                  builder: (BuildContext context, MagicNumbersState state) {
                    if (state is MagicNumbersState) {
                      return _buildCard(state.props);
                    }
                    //TODO: remove this...
                    return Container();
                  },
                ),
              ),
            ),
            !memorizedNumber
                ? MagicNumbersButton(
                    title: 'OK!',
                    color: Colors.deepPurpleAccent,
                    titleColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_numbers/src/bloc/bloc.dart';
import 'package:magic_numbers/src/widgets/widgets.dart';

class Play extends StatelessWidget {
  TextStyle _titleTextStyle() {
    return TextStyle(
      fontFamily: 'RugeBoogie',
      fontSize: 42.0,
      letterSpacing: 1.5,
      color: Colors.deepPurple[900],
    );
  }

  Container _buildPlayButton(
      String text, IconData icon, Color color, Function onPressed) {
    return Container(
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
      width: 250.0,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: card.map(
          (num) {
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
          },
        ).toList(),
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
              child: BlocBuilder<MagicNumbersBloc, MagicNumbersState>(
                builder: (BuildContext context, MagicNumbersState state) {
                  if (state is MagicNumbersInitial) {
                    return Text(
                      'Memorize um número',
                      style: _titleTextStyle(),
                    );
                  }
                  if (state is MagicNumbersPlayingState) {
                    return Text(
                      'Seu número está aqui?',
                      style: _titleTextStyle(),
                    );
                  }
                  return Text(
                    'Ops. Por favor reinicie o aplicativo.',
                    style: _titleTextStyle(),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
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
                    if (state is MagicNumbersInitial) {
                      return _buildCard(state.props);
                    }
                    //TODO: add the cards flow HERE...
                    if(state is MagicNumbersPlayingState) {
                      Container(
                        color: Colors.redAccent,
                        width: 250.0,
                        child: Center(
                          child: Icon(
                            Icons.close, color: Colors.white, size: 50.0,),
                        ),
                      );
                    }
                    return Container(
                      color: Colors.redAccent,
                      width: 250.0,
                      child: Center(
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
            BlocBuilder<MagicNumbersBloc, MagicNumbersState>(
              builder: (BuildContext context, MagicNumbersState state) {
                if (state is MagicNumbersInitial) {
                  return MagicNumbersButton(
                    title: 'OK!',
                    color: Colors.deepPurpleAccent,
                    titleColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () {
                      BlocProvider.of<MagicNumbersBloc>(context).add(MemorizedNumberEvent());
                    },
                  );
                }
                if (state is MagicNumbersPlayingState) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildPlayButton(
                            'SIM', Icons.check, Colors.deepPurpleAccent, () {}),
                        _buildPlayButton('NÃO', Icons.close, Colors.redAccent,
                            () {
                          Navigator.popAndPushNamed(context, '/abrakadabra');
                        }),
                      ],
                    ),
                  );
                }
                return MagicNumbersButton(
                  title: 'Entendo :(',
                  color: Colors.deepPurpleAccent,
                  titleColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () {
                    print('Erro nos estados da página de jogo.');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

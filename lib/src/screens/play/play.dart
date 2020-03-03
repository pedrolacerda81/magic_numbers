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

  Container _buildPlayButtonsRow(
      {Function onPressedYes, VoidCallback onPressedNo}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildPlayButton(
              'SIM', Icons.check, Colors.deepPurpleAccent, onPressedYes),
          _buildPlayButton('NÃO', Icons.close, Colors.redAccent, onPressedNo),
        ],
      ),
    );
  }

  Container _buildCard(List<int> card) {
    return Container(
      width: 210.0,
      alignment: Alignment.center,
      padding: EdgeInsets.all(3.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: card.map(
          (num) {
            return CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                num.toString(),
                style: TextStyle(
                  fontSize: 20.0,
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
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => BlocProvider.of<MagicNumbersBloc>(context)
                .add(ResetGameEvent()),
            //TODO: verify why isn't this refreshing the game on Android...
            //try to pass a new random number
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
                  if (state is CheckingZeroState ||
                      state is CheckingOneState ||
                      state is CheckingTwoState ||
                      state is CheckingThreeState ||
                      state is CheckingFourState ||
                      state is CheckingFiveState) {
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
                    if (state is MagicNumbersInitial ||
                        state is CheckingZeroState ||
                        state is CheckingOneState ||
                        state is CheckingTwoState ||
                        state is CheckingThreeState ||
                        state is CheckingFourState ||
                        state is CheckingFiveState) {
                      return _buildCard(state.card.toList()..shuffle());
                    }
                    return Container(
                      width: 250.0,
                      height: 200.0,
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
                      BlocProvider.of<MagicNumbersBloc>(context)
                          .add(CheckZeroEvent());
                    },
                  );
                }
                if (state is CheckingZeroState) {
                  return _buildPlayButtonsRow(
                    onPressedYes: () {
                      final int result = state.result + state.card.first;
                      BlocProvider.of<MagicNumbersBloc>(context)
                          .add(CheckOneEvent(result: result));
                    },
                    onPressedNo: () =>
                        BlocProvider.of<MagicNumbersBloc>(context)
                            .add(CheckOneEvent(result: state.result)),
                  );
                }
                if (state is CheckingOneState) {
                  return _buildPlayButtonsRow(
                    onPressedYes: () {
                      final int result = state.result + state.card.first;
                      BlocProvider.of<MagicNumbersBloc>(context)
                          .add(CheckTwoEvent(result: result));
                    },
                    onPressedNo: () =>
                        BlocProvider.of<MagicNumbersBloc>(context)
                            .add(CheckTwoEvent(result: state.result)),
                  );
                }
                if (state is CheckingTwoState) {
                  return _buildPlayButtonsRow(
                    onPressedYes: () {
                      final int result = state.result + state.card.first;
                      BlocProvider.of<MagicNumbersBloc>(context)
                          .add(CheckThreeEvent(result: result));
                    },
                    onPressedNo: () =>
                        BlocProvider.of<MagicNumbersBloc>(context)
                            .add(CheckThreeEvent(result: state.result)),
                  );
                }
                if (state is CheckingThreeState) {
                  return _buildPlayButtonsRow(
                    onPressedYes: () {
                      final int result = state.result + state.card.first;
                      BlocProvider.of<MagicNumbersBloc>(context)
                          .add(CheckFourEvent(result: result));
                    },
                    onPressedNo: () =>
                        BlocProvider.of<MagicNumbersBloc>(context)
                            .add(CheckFourEvent(result: state.result)),
                  );
                }
                if (state is CheckingFourState) {
                  return _buildPlayButtonsRow(
                    onPressedYes: () {
                      final int result = state.result + state.card.first;
                      BlocProvider.of<MagicNumbersBloc>(context)
                          .add(CheckFiveEvent(result: result));
                    },
                    onPressedNo: () =>
                        BlocProvider.of<MagicNumbersBloc>(context)
                            .add(CheckFiveEvent(result: state.result)),
                  );
                }
                if (state is CheckingFiveState) {
                  return _buildPlayButtonsRow(onPressedYes: () {
                    final int result = state.result + state.card.first;
                    Navigator.pushReplacementNamed(context, '/abrakadabra',
                        arguments: result);
                  }, onPressedNo: () {
                    Navigator.pushReplacementNamed(context, '/abrakadabra',
                        arguments: state.result);
                  });
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

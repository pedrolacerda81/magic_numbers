import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
          ),
        ),
        child: Column(
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
                  SizedBox(height: 10.0),
                  Text(
                    'Magic Numbers',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        OutlineButton(
                          splashColor: Colors.white,
                          child: Text(
                            'SOBRE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
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
                          splashColor: Theme.of(context).primaryColor,
                          color: Colors.white,
                          child: Text(
                            'JOGAR!',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/magic-numbers');
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
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

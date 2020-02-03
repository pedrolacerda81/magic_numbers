import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  void _launchGitHubUrl() async {
    const url = 'https://github.com/pedrolacerda81';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não consegui acessar $url';
    }
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
        title: Text('Sobre', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 125.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.deepPurpleAccent,
                            Colors.deepPurple
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/profile-pic.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'PEDRO LACERDA DA COSTA',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 3.0),
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            child: Text('hello.'),
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
                    'GITHUB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    print("pressed 'go to github' button!");
                    _launchGitHubUrl();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

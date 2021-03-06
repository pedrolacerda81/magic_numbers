import 'package:flutter/material.dart';
import 'package:magic_numbers/src/widgets/widgets.dart';
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
        title: Text('Sobre', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 130.0,
                      width: 130.0,
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
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                _bioText(
                    'Olá, sou engenheiro da computação e desenvolvedor mobile usando essa maravilhosa framework.'),
                SizedBox(height: 13.0),
                _bioText(
                    'A ideia deste simples jogo é divertir e também expor um pouco do meu trabalho como desenvolvedor.'),
                SizedBox(height: 13.0),
                _bioText(
                    'Espero que você se divirta e, se gostar, você pode compartilhar com seus amigos e também dar uma olhada no meu GitHub.'),
                SizedBox(height: 13.0),
                _bioText('Mas só se você quiser :)')
              ],
            ),
          ),
          MagicNumbersButton(
            title: 'GITHUB',
            color: Colors.deepPurpleAccent,
            titleColor: Colors.white,
            splashColor: Colors.white,
            onPressed: () => _launchGitHubUrl(),
          ),
        ],
      ),
    );
  }
}

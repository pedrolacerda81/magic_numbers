import 'package:flutter/material.dart';
import './screens/screens.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Numbers',
      theme: ThemeData(
        fontFamily: 'VarelaRound',
        primarySwatch: Colors.deepPurple,
      ),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  if (settings.name == '/home') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    });
  }

  if (settings.name == '/magic-numbers') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return MagicNumbers();
    });
  }

  if (settings.name == '/about') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return About();
    });
  }

  if (settings.name == '/play') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Play();
    });
  }

  return MaterialPageRoute(builder: (BuildContext context) {
    return Home();
  });
}

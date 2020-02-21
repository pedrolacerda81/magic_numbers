import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/bloc.dart';
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
      return BlocProvider(
        create: (BuildContext context) => MagicNumbersBloc(),
        child: Play(),
      );
    });
  }

  if (settings.name == '/abrakadabra') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Abrakadabra(result: settings.arguments,);
    });
  }

  return MaterialPageRoute(builder: (BuildContext context) {
    return Home();
  });
}

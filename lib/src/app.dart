import 'package:flutter/material.dart';
import './screens/screens.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Numbers',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  if (settings.name == '/magic-numbers') {
    return MaterialPageRoute(builder: (BuildContext context) {
      return MagicNumbers();
    });
  }
  return MaterialPageRoute(builder: (BuildContext context) {
    return Home();
  });
}

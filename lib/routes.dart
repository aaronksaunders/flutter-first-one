import 'package:first_one/screens/MyHomePage.dart';
import 'package:first_one/screens/MySecondPage.dart';
import 'package:flutter/material.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new MyHomePage(title: 'Flutter Home Page'),
    '/second': (BuildContext context) => new MySecondPage(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Flutter Demo App',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: routes,
    ));
  }
}

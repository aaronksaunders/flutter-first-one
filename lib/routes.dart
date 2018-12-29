import 'package:first_one/screens/MyHomePage.dart';
import 'package:first_one/screens/MySecondPage.dart';
import 'package:first_one/screens/auth/CreateAccountPage.dart';
import 'package:first_one/screens/auth/LoadingPage.dart';
import 'package:first_one/screens/auth/LoginPage.dart';
import 'package:flutter/material.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => new MyHomePage(title: 'Flutter Home Page'),
    '/login': (BuildContext context) => new LoginPage(),
    '/createAccount': (BuildContext context) => new CreateAccountPage(),
    '/second': (BuildContext context) => new MySecondPage(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Flutter Demo App',
      theme: ThemeData(primarySwatch: Colors.green),
      //initialRoute: '/login',
      routes: routes,
      home: LoadingPage(),
    ));
  }
}

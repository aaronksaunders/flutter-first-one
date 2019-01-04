import 'package:first_one/helpers/auth.dart';
import 'package:first_one/screens/MyHomePage.dart';
import 'package:first_one/screens/auth/LoginPage.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingPageState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

class _LoadingPageState extends State<LoadingPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;

  @override
  void initState() {
    super.initState();
    var auth = Auth();
    auth.currentUser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return LoginPage();
      case AuthStatus.signedIn:
        return MyHomePage();
    }
    return null;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new FutureBuilder(
  //       future: new Future(() async {
  //         var auth = Auth();
  //         return await auth.currentUser();
  //       }),
  //       builder: (BuildContext context, AsyncSnapshot<String> user) {

  //       });
  // }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

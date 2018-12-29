import 'dart:async';

class Auth {
  String user;

  Future<String> signIn(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 200), () {
      if (email == 'aaron@in3dc.com') {
        this.user = email;
        return 'aaron@in3dc.com';
      }
      return null;
    });
  }

  Future<String> createUser(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 200), () {
      return this.user;
    });
  }

  Future<String> currentUser() async {
    return Future.delayed(const Duration(milliseconds: 200), () {
      return this.user;
    });
  }

  Future<void> signOut() async {
    return Future.delayed(const Duration(milliseconds: 200), () {
      return;
    });
  }
}

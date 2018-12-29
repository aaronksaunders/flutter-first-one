import 'dart:async';

class Auth {
  String user;

  Future<String> signIn(String email, String password) async {
    if (email == 'aaron@in3dc.com') {
      this.user = email;
      return 'aaron@in3dc.com';
    }
    return null;
  }

  Future<String> createUser(String email, String password) async {
    return null;
  }

  Future<String> currentUser() async {
    return this.user;
  }

  Future<void> signOut() async {
    this.user = null;
    return;
  }
}

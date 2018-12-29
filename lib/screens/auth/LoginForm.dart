import 'package:first_one/helpers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Create a Form Widget
class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class _LoginCredentials {
  String email = '';
  String password = '';
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<LoginFormState>!
  final _formKey = GlobalKey<FormState>();
  _LoginCredentials credentials = new _LoginCredentials();
  var auth = new Auth();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              decoration:
                  InputDecoration(labelText: 'Enter your email address'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onSaved: (String value) {
                this.credentials.email = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Enter your password'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                },
                onSaved: (String value) {
                  this.credentials.password = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: 200.0,
              textColor: Colors.white,
              onPressed: () async {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {

                  _formKey.currentState.save(); // Save our form now.

                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));

                  var result = await auth.signIn(
                      this.credentials.email, this.credentials.password);
                  if (result != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                  Scaffold.of(context).hideCurrentSnackBar();
                }
              },
              child: Text('Login User'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: 200.0,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
              child: Text('Create New User Account'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: 200.0,
              textColor: Colors.white,
              onPressed: () {
                _formKey.currentState.reset();
              },
              child: Text('Reset Form'),
            ),
          ),
        ],
      ),
    );
  }
}

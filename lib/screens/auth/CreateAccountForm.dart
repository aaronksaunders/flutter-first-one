import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Create a Form Widget
class CreateAccountForm extends StatefulWidget {
  @override
  CreateAccountFormState createState() {
    return CreateAccountFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.

class CreateAccountFormState extends State<CreateAccountForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<CreateAccountFormState>!
  final _formKey = GlobalKey<FormState>();

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
              decoration: InputDecoration(labelText: 'Enter your First Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Enter your Last Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Enter your password'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              minWidth: 200.0,
              textColor: Colors.white,
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Save New User Account'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: MaterialButton(
              minWidth: 200.0,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}

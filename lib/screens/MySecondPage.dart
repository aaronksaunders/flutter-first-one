import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySecondPage extends StatefulWidget {
  final int count;

  MySecondPage({Key key, this.count}) : super(key: key);

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
    );
  }
}

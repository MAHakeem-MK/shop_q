import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  CustomerHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  double buttonWidth = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Near By Stores'),),
      body: Center(child: Text('No stores near by!'),),
    );
  }
}

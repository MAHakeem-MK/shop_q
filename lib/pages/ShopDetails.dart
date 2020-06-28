import 'package:flutter/material.dart';

class ShopDetails extends StatefulWidget {
  ShopDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  double buttonWidth = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Products'),
      ),
      body: Center(

      ),
    );
  }
}
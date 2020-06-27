import 'package:flutter/material.dart';

class ShopOwnerHome extends StatefulWidget {
  ShopOwnerHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopOwnerHomeState createState() => _ShopOwnerHomeState();
}

class _ShopOwnerHomeState extends State<ShopOwnerHome> {
  double buttonWidth = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Shop owner page'),),
    );
  }
}

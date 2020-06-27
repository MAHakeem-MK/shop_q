import 'package:flutter/material.dart';
import 'package:shopq/pages/CustomerHome.dart';
import 'package:shopq/pages/ShopOwnerHome.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double buttonWidth = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Text(widget.title),
            SizedBox(
              width: buttonWidth,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShopOwnerHome()));
                },
                child: Text("I'm a Shop Owner"),
              ),
            ),
            SizedBox(
              width: buttonWidth,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomerHome()));
                },
                child: Text("I'm a Customer"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

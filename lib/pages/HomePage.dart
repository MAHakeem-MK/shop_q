import 'package:flutter/material.dart';
import 'package:shopq/pages/CustomerHome.dart';
import 'package:shopq/pages/ShopOwnerHome.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
            SizedBox(width: 140, child: Image.asset('assets/shopq_logo.png')),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                widget.title,
                style: GoogleFonts.piedra(
                    fontSize: 24.0, color: Theme.of(context).primaryColorDark),
              ),
            ),
            SizedBox(
              width: buttonWidth,
              child: GFButton(
                color: Theme.of(context).accentColor,
                size: GFSize.LARGE,
                type: GFButtonType.outline2x,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShopOwnerHome()));
                },
                child: Text("I'm a Shop Owner"),
              ),
            ),
            SizedBox(
              width: buttonWidth,
              child: GFButton(
                color: Theme.of(context).accentColor,
                size: GFSize.LARGE,
                type: GFButtonType.outline2x,
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

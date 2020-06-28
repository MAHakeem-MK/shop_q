import 'package:flutter/material.dart';
import 'package:shopq/pages/ShopDetails.dart';
import 'package:shopq/repositories/shops.dart';

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
      appBar: AppBar(
        title: Text('Near By Stores'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: Shops.allShops.length,
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(Shops.allShops[position].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopDetails(),
                ),
              );
            },
          );
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopq/repositories/customers.dart';

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
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: Customers.allCustomers.length,
            itemBuilder: (context, position) => ListTile(
                  title: Text(Customers.allCustomers[position].name),
                )),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.title),title: Text("New Orders")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text("Ready to serve")),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm),title: Text("Inventory")),
      ]),
    );
  }
}

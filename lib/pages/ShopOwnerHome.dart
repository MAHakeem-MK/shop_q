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
  int _currentIndex = 0;
  final List<Widget> _tabViews = [NewOrders(), ReadyToServe(), Inventory()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: _tabViews[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.save_alt), title: Text("New Orders")),
            BottomNavigationBarItem(
                icon: Icon(Icons.unarchive), title: Text("Ready to serve")),
            BottomNavigationBarItem(
                icon: Icon(Icons.store), title: Text("Inventory")),
          ]),
    );
  }
}

class NewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
          itemBuilder: (context, position) => ListTile(
                leading: Icon(Icons.person_pin),
                title: Text(Customers.allCustomers[position].name),
                subtitle: Text(Customers.allCustomers[position].phone),
              ),
          separatorBuilder: (context, position) => Divider(
                color: Theme.of(context).accentColor,
              ),
          itemCount: Customers.allCustomers.length),
    );
  }
}

class ReadyToServe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/getflutter.dart';
import 'package:shopq/repositories/orders.dart';

class ShopOwnerHome extends StatefulWidget {
  ShopOwnerHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopOwnerHomeState createState() => _ShopOwnerHomeState();
}

class _ShopOwnerHomeState extends State<ShopOwnerHome> {
  double buttonWidth = 180;
  int _currentIndex = 0;
  String _title = 'Orders';
  final List<Widget> _tabViews = [NewOrders(), ReadyToServe(), Inventory()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _tabViews[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              if(_currentIndex == 2) {
                _title = 'Inventory';
              } else {
                _title = 'Orders';
              }
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

class NewOrders extends StatefulWidget {
  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
          itemBuilder: (context, position) => ListTile(
                leading: GFAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/blank_profile.png'),
                ),
                title: Text(Orders.newOrders[position].name),
                subtitle: Text(Orders.newOrders[position].phone),
                trailing: Checkbox(
                    value: Orders.newOrders[position].isReady,
                    onChanged: (state) {
                      setState(() {
                        Orders.newOrders[position].isReady = state;
                        Orders.readyToServe.add(Orders.newOrders[position]);
                        Orders.newOrders.remove(Orders.newOrders[position]);
                      });
                    }),
              ),
          separatorBuilder: (context, position) => Divider(
                color: Theme.of(context).accentColor,
              ),
          itemCount: Orders.newOrders.length),
    );
  }
}

class ReadyToServe extends StatefulWidget {
  @override
  _ReadyToServeState createState() => _ReadyToServeState();
}

class _ReadyToServeState extends State<ReadyToServe> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
          itemBuilder: (context, position) => ListTile(
            leading: GFAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/blank_profile.png'),
            ),
            title: Text(Orders.readyToServe[position].name),
            subtitle: Text(Orders.readyToServe[position].phone),
            trailing: Checkbox(
                value: Orders.readyToServe[position].isDone,
                onChanged: (state) {
                  setState(() {
                    Orders.readyToServe[position].isDone = state;
                    Orders.readyToServe.remove(Orders.readyToServe[position]);
                  });
                }),
          ),
          separatorBuilder: (context, position) => Divider(
            color: Theme.of(context).accentColor,
          ),
          itemCount: Orders.readyToServe.length),
    );
  }
}

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
          itemBuilder: (context, position) => ListTile(
            leading: GFAvatar(
              shape: GFAvatarShape.standard,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/product.png'),
            ),
            title: Text(Orders.inventory[position].name),
            subtitle: Text(Orders.inventory[position].stock.toString()),

          ),
          separatorBuilder: (context, position) => Divider(
            color: Theme.of(context).accentColor,
          ),
          itemCount: Orders.inventory.length),
    );
  }
}

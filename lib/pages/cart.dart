import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:shopq/repositories/orders.dart';

class Cart extends StatefulWidget {
  Cart({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: ListView.separated(
                    itemBuilder: (context, position) => ListTile(
                      leading: GFAvatar(
                        shape: GFAvatarShape.standard,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/product.png'),
                      ),
                      title: Text(Orders.carted[position].name),
                      subtitle:
                      Text(Orders.carted[position].MRP.toString()),
                    ),
                    separatorBuilder: (context, position) => Divider(
                      color: Theme.of(context).accentColor,
                    ),
                    itemCount: Orders.carted.length),
              ),
            ),
          ],
        ));
  }
}

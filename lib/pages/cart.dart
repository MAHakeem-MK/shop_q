import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:getflutter/types/gf_button_type.dart';
import 'package:shopq/repositories/orders.dart';

import 'CheckOut.dart';

class Cart extends StatefulWidget {
  Cart({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    Orders.carted.forEach((element) {total += element.MRP;});
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
                      Text('MRP : ${Orders.carted[position].MRP.toString()}'),
                    ),
                    separatorBuilder: (context, position) => Divider(
                      color: Theme.of(context).accentColor,
                    ),
                    itemCount: Orders.carted.length),
              ),
            ),
            ListTile(title: Text('Total Amount : $total'),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: GFButton(
                fullWidthButton: true,
                color: Theme.of(context).accentColor,
                size: GFSize.LARGE,
                type: GFButtonType.outline2x,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckOut()));
                },
                child: Text("Check out"),
              ),
            ),
          ],
        ));
  }
}

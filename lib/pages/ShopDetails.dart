import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/badge/gf_badge.dart';
import 'package:getflutter/components/badge/gf_icon_badge.dart';
import 'package:getflutter/getflutter.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:shopq/pages/cart.dart';
import 'package:shopq/repositories/orders.dart';
import 'package:shopq/widgets/search_form_field.dart';

class ShopDetails extends StatefulWidget {
  ShopDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  double buttonWidth = 180;
  int _cartCount = Orders.carted.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Available Products'),
          actions: <Widget>[
            GFIconBadge(
                child: IconButton(
                    icon: Icon(Icons.shopping_cart), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                }),
                counterChild: GFBadge(
                  color: Colors.blue,
                  shape: GFBadgeShape.circle,
                  child: Text('$_cartCount'),
                ),)
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchFormField(
                hint: "Search Store",
              ),
            ),
            Expanded(
              child: Center(
                child: ListView.separated(
                    itemBuilder: (context, position) => ListTile(
                          leading: GFAvatar(
                            shape: GFAvatarShape.standard,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage('assets/product.png'),
                          ),
                          title: Text(Orders.inventory[position].name),
                          subtitle:
                              Text(Orders.inventory[position].MRP.toString()),
                          trailing: IconButton(
                              icon: Icon(Icons.add_shopping_cart),
                              onPressed: () {
                                setState(() {
                                  _cartCount++;
                                  Orders.carted.add(Orders.inventory[position]);
                                });
                              }),
                        ),
                    separatorBuilder: (context, position) => Divider(
                          color: Theme.of(context).accentColor,
                        ),
                    itemCount: Orders.inventory.length),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:shopq/pages/ShopDetails.dart';
import 'package:shopq/repositories/shops.dart';
import 'package:shopq/widgets/search_form_field.dart';

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
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchFormField(
              hint: "Search Store",
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, position) => ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShopDetails())),
                leading: GFAvatar(
                  shape: GFAvatarShape.standard,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/store.png'),
                ),
                title: Text(Shops.allShops[position].name),
                subtitle: Row(
                  children: [
                    Icon(Icons.phone,size: 15.0,color: Colors.blue,),
                    Text(Shops.allShops[position].phone),
                  ],
                ),
              ),
              separatorBuilder: (context, position) => Divider(
                color: Theme.of(context).accentColor,
              ),
              itemCount: Shops.allShops.length,
            ),
          ),
        ],
      )),
    );
  }
}

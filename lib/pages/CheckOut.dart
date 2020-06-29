import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/size/gf_size.dart';
import 'package:getflutter/types/gf_button_type.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int _radioValue = -1;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Time"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "These are available time slots given by shop owner,select one, and be there on time!"),
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                '10:00 am - 10:15 am',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                '01:15 pm - 01:30 pm',
                style: new TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 2,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                '02:15 pm - 02:30 pm',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: GFButton(
              fullWidthButton: true,
              color: Theme.of(context).accentColor,
              size: GFSize.LARGE,
              type: GFButtonType.outline2x,
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Done"),
            ),
          ),
        ],
      ),
    );
  }
}

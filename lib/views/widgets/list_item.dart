import 'package:flutter/material.dart';
import 'package:flutter_daily_currency_app/models/currency.dart';

class ListItem extends StatelessWidget{

  final Currency unit;
  
  ListItem({@required this.unit});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ListTile(
          title: new Text(unit.name + " = " + unit.rate.toString() + "€"),
        ),
        Divider()
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_daily_currency_app/views/widgets/list_item.dart';
import 'package:flutter_daily_currency_app/models/currency.dart';
import 'package:flutter_daily_currency_app/view_models/main_page_view_model.dart';




class CurrencyList extends StatelessWidget{
  final MainPageViewModel viewModel;

  CurrencyList({this.viewModel});

  Widget currencyList(var units){
    return ListView.builder(
        itemCount: units == null ? 0 : units.length,
        itemBuilder: (_, int index) {
          var unit = units[index];
          return ListItem(unit: unit);
        });
    
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child:FutureBuilder<List<Currency>>(
        future: viewModel.currencyList,
        builder: (BuildContext context, AsyncSnapshot<List<Currency>> snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:{
            return Center(child: CircularProgressIndicator());


          }
              case ConnectionState.done:
              if (snapshot.hasData) {
                return currencyList(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Please check your internet connection, and restrat the app"),
                );
              }

          }

        },
      ),
    );
  }
}
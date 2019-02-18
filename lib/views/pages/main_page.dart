import 'package:flutter/material.dart';
import 'package:flutter_daily_currency_app/view_models/main_page_view_model.dart';
import 'package:flutter_daily_currency_app/services/currency_api_service.dart';
import 'dart:async';
import 'package:flutter_daily_currency_app/views/widgets/currency_list.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageViewModel viewModel;
  DateTime _current = DateTime.now();

  @override
  void initState() {
    viewModel = MainPageViewModelImpl(api: CurrencyApiService());
    viewModel.setDate(DateTime.now());
    _current = DateTime.now();
    super.initState();
  }



  Future<Null> _selectDate(BuildContext context) async {

    DateTime _selected = await showDatePicker(
        context: context,
        initialDate: _current,
        firstDate: new DateTime.utc(1999, 01, 04), //service provides after the 1999
        lastDate: new DateTime.now(),
    );

        if(_selected != null && _selected != viewModel.date){
          viewModel.setDate(_selected);
          setState(() {
            _current = _selected;
          });
        }
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: new AppBar(
        title: Text("Currency Exchange"),
      ),
      body: new Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Date Selected: ${_current.toString().substring(0,10)}'),
                onPressed: (){_selectDate(context);},
              ),
              Expanded(
                child: CurrencyList(
                  viewModel: viewModel,
                )
              ),
              Divider()
            ],

        ),


      ),
    );
  }
}


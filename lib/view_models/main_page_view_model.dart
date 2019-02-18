import 'dart:async';
import 'package:flutter_daily_currency_app/models/currency.dart';
import 'package:flutter_daily_currency_app/interfaces/interface_currency_api.dart';

abstract class MainPageViewModel{

  Future<List<Currency>> get currencyList;
  DateTime date;

  setDate(DateTime value){
    date = value;
  }

}

class MainPageViewModelImpl implements MainPageViewModel{

  var _dateController = StreamController<DateTime>.broadcast(sync: true);

  @override
  DateTime date;


  final InterfaceCurrencyApi api;
  MainPageViewModelImpl({this.api});

  @override
  // TODO: implement currencyList
  Future<List<Currency>> get currencyList =>  api.getCurrency(date);




  @override
  setDate(DateTime value){
    date = value;
    _dateController.add(value);
  }



  void dispose() => _dateController;







}
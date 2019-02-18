import 'dart:async';
import 'package:flutter_daily_currency_app/models/currency.dart';


abstract class InterfaceCurrencyApi{

  Future<List<Currency>> getCurrency(DateTime date);

}
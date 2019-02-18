import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';
import 'package:flutter_daily_currency_app/models/currency.dart';
import 'package:flutter_daily_currency_app/interfaces/interface_currency_api.dart';

class CurrencyApiService implements InterfaceCurrencyApi {
  final HttpClient _httpClient = HttpClient();
  final String _url = 'api.exchangeratesapi.io';



  Future<List<Currency>> getCurrency(DateTime date) async {


    final uri = Uri.https(_url, '/${date.toString().substring(0,10)}');
    final jsonResponse = await _getJson(uri);

    
    if (jsonResponse == null) {
      print('Error retrieving units.');
      return null;
    }

    List<Currency> currencyList = new List();
    jsonResponse['rates'].forEach((a,b) => currencyList.add(Currency.fromMap(a,b)));
    return currencyList;
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}

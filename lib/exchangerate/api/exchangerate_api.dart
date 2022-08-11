import 'dart:convert';
import 'package:flutter_exchangerate_app/model/nation.dart';
import 'package:http/http.dart' as http;

class ExchangerateApi {
  Future<Map<String, dynamic>> getConversionRates(String query) async {
    Uri url = Uri.parse(
        'https://v6.exchangerate-api.com/v6/72f97e0215e12ca9944fef45/latest/$query');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json.isEmpty) {
      return {};
    }
    Map<String, dynamic> conversionRates = json['conversion_rates'];
    return conversionRates;
  }

  List<National> getNationalName() {
    Map<String, dynamic> json = jsonDecode('jsonfiles/currencyCode.json');

    Iterable nationsList = json[''];
    return nationsList.map((e) => National.fromJson(e)).toList();
  }
}

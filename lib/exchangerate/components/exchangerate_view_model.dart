import 'package:flutter/material.dart';
import 'package:flutter_exchangerate_app/model/nation.dart';

import '../api/exchangerate_api.dart';

class ExchangerateViewModel extends ChangeNotifier {
  final exchangerateApi = ExchangerateApi();
  Map<String, dynamic> conversionRates = {};
  List<String> shownList = [];
  List<String> hiddenList = [];
  List<Country> nations = [];

  Future fetchConversionRates(String query) async {
    conversionRates = await exchangerateApi.getConversionRates(query);
    shownList = conversionRates.keys.toList();
    nations = await exchangerateApi.getNationalName();
    notifyListeners();
  }

  void addList(String query) {
    shownList.add(query);
    hiddenList.remove(query);
  }

  void dismissList(String query) {
    shownList.remove(query);
    hiddenList.add(query);
  }

  String findCountryName(String query) {
    String foundCountry = '';
    nations
        .where((element) => element.currencyCode == query)
        .toList()
        .forEach((element) {
      foundCountry = element.country;
    });
    return foundCountry;
  }

  String findimageUrl(String query) {
    String imageUrl = '';
    nations
        .where((element) => element.currencyCode == query)
        .toList()
        .forEach((element) {
      imageUrl = element.imageUrl;
    });
    return imageUrl;
  }
}

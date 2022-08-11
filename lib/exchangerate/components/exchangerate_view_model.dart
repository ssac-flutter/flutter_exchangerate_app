import 'package:flutter/material.dart';

import '../api/exchangerate_api.dart';

class ExchangerateViewModel extends ChangeNotifier {
  final _exchangerateApi = ExchangerateApi();
  Map<String, dynamic> conversionRates = {};
  List<String> shownList = [];
  List<String> hiddenList = [];

  Future fetchConversionRates(String query) async {
    conversionRates = await _exchangerateApi.getConversionRates(query);
    shownList = conversionRates.keys.toList();

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
}

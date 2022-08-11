import 'package:flutter/material.dart';
import 'package:flutter_exchangerate_app/model/nation.dart';

import '../api/exchangerate_api.dart';

class ExchangerateViewModel extends ChangeNotifier {
  final _exchangerateApi = ExchangerateApi();
  Map<String, dynamic> conversionRates = {};
  List<String> shownList = [];
  List<String> hiddenList = [];
  List<National> nations = [];

  Future fetchConversionRates(String query) async {
    conversionRates = await _exchangerateApi.getConversionRates(query);
    shownList = conversionRates.keys.toList();
    nations = _exchangerateApi.getNationalName();

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

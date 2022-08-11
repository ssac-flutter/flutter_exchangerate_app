import 'package:flutter/material.dart';

import '../api/exchangerate_api.dart';

class ExchangerateViewModel extends ChangeNotifier {
  final _exchangerateApi = ExchangerateApi();
  Map<String, dynamic> conversionRates = {};

  void fetchConversionRates(String query) async {
    conversionRates = await _exchangerateApi.getConversionRates(query);

    notifyListeners();
  }
}

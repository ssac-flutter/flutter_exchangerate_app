import 'package:flutter_exchangerate_app/data/datasource/local/country_api.dart';
import 'package:flutter_exchangerate_app/data/datasource/remote/exchange_rate_api.dart';
import 'package:flutter_exchangerate_app/data/model/country.dart';
import 'package:flutter_exchangerate_app/data/model/exchange_rate.dart';

class ExchangeRateRepository {
  final _countryApi = CountryApi();
  final _exchangeRateApi = ExchangeRateApi();

  Future<List<ExchangeRate>> getExchangeRateList(String query) async {
    final conversionRates = await _exchangeRateApi.getConversionRates(query);
    final countries = await _countryApi.getNationalName();

    return countries.map((Country country) {
      final conversionRate = conversionRates[country.currencyCode];

      return ExchangeRate(
        imageUrl: country.imageUrl,
        countryName: country.country,
        currency: country.currencyCode,
        conversionRate: conversionRate,
      );
    }).toList();
  }
}

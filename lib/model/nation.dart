class Country {
  final String currencyCode;
  final String currencyName;
  final String country;

  Country({
    required this.currencyCode,
    required this.currencyName,
    required this.country,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      currencyCode: json['Currency Code'] as String,
      currencyName: json['Currency Name'] as String,
      country: json['Country'] as String,
    );
  }
}

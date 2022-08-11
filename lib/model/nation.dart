class National {
  final String currencyCode;
  final String currencyName;
  final String country;

  National({
    required this.currencyCode,
    required this.currencyName,
    required this.country,
  });

  factory National.fromJson(Map<String, dynamic> json) {
    return National(
      currencyCode: json['Currency Code'] as String,
      currencyName: json['Currency Name'] as String,
      country: json['Country'] as String,
    );
  }
}

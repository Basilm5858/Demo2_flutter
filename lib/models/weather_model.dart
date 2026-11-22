class WeatherModel {
  final String weatherImageUrl;
  final String countryImageUrl;
  final String weatherCondition;
  final String name;
  final String tempreature;

  new({
    required this.weatherImageUrl,
    required this.countryImageUrl,
    required this.weatherCondition,
    required this.name,
    required this.tempreature,
  });
}

class Country {
  final List<WeatherModel> countries;

  new({required this.countries});

  factory Country.fromJson(Map<String, dynamic> json) {
    final tempList = json["country"]
        .map<WeatherModel>(
          (country) => WeatherModel(
            weatherImageUrl: country["weatherImageUrl"] ?? "",
            countryImageUrl: country["countryImageUrl"] ?? "",
            weatherCondition: country["weatherCondition"] ?? "",
            name: country["name"] ?? "",
            tempreature: country["tempreature"] ?? "",
          ),
        )
        .toList();
    return Country(countries: tempList);
  }
}

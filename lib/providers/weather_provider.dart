import 'package:demo2/models/weather_model.dart';
import 'package:demo2/services/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  Country? country;
  Future<void> getweather() async {
    country = await WeatherService.getWeather();
    notifyListeners();
  }
}

import 'package:demo2/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  static Dio dio = Dio();
  static Future<Country> getWeather() async {
    Response response = await dio.get(
      "https://iats.runasp.net/api/Country/GetCountries",
    );
    return Country.fromJson(response.data);
  }
}

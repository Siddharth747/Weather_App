import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final queryparameters = {
      'q': city,
      'appid': 'eca4118297a7cebc5fe9049f1df4acf0',
      'units': 'metric'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryparameters);

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}

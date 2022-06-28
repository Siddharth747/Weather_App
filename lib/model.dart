/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],

  "main": {
    "temp": 282.55,
  },
  "name": "Mountain View",
  
  }                                           
*/

class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;
  TemperatureInfo({this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempinfo;
  final WeatherInfo weatherinfo;
  WeatherResponse({
    this.cityName,
    this.tempinfo,
    this.weatherinfo,
  });
  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final tempInfoJson = json['main'];
    final weatherInfoJson = json['weather'][0];
    final weatherinfo = WeatherInfo.fromJson(weatherInfoJson);
    final tempinfo = TemperatureInfo.fromJson(tempInfoJson);
    return WeatherResponse(
        cityName: cityName, tempinfo: tempinfo, weatherinfo: weatherinfo);
  }
}

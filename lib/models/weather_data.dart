import 'package:weatherapp/models/weather_conditions.dart';

class WeatherData {
  String weatherTime;
  String tempC;
  String tempF;
  int isDay;
  double windMPH;
  double windKPH;
  double windDegree;
  String windDir;
  double pressureMB;
  double pressureIN;
  double precipMM;
  double precipIN;
  double humidity;
  double cloud;
  double feelslikeC;
  double feelslikeF;
  double visKM;
  double visMile;
  double uv;
  double gustMPH;
  double gustKPH;
  WeatherConditions condition;

  WeatherData(
      this.weatherTime,
      this.tempC,
      this.tempF,
      this.isDay,
      this.windMPH,
      this.windKPH,
      this.windDegree,
      this.windDir,
      this.pressureMB,
      this.pressureIN,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKM,
      this.visMile,
      this.uv,
      this.gustMPH,
      this.gustKPH,
      this.precipIN,
      this.precipMM,
      this.condition);

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        json["time"] ?? json['last_updated'] ?? "",
        json["temp_c"].toString() + "\u2103",
        json["temp_f"].toString() + "\u2109",
        json["is_day"],
        json["wind_mph"].toDouble(),
        json["wind_kph"].toDouble(),
        json["wind_degree"].toDouble(),
        json["wind_dir"],
        json["pressure_mb"].toDouble(),
        json["pressure_in"].toDouble(),
        json["precip_mm"].toDouble(),
        json["precip_in"].toDouble(),
        json["humidity"].toDouble(),
        json["cloud"].toDouble(),
        json["feelslike_c"].toDouble(),
        json["feelslike_f"].toDouble(),
        json["vis_km"].toDouble(),
        json["vis_miles"].toDouble(),
        json["uv"].toDouble(),
        json["gust_mph"].toDouble(),
        json["gust_kph"].toDouble(),
        WeatherConditions.fromJson(json['condition']));
  }
}

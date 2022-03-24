import 'dart:convert';
import 'package:weatherapp/models/weather_data.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

Future<List<WeatherData>> getData(String city) async {
  var url = Uri.parse(
      "https://api.weatherapi.com/v1/forecast.json?key=ced82b3f05e54bb891873215222103&q=$city&days=1&aqi=no&alerts=no");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    List<WeatherData> weatherDataList = [];
    var jsonResponse = jsonDecode(response.body);
    weatherDataList.add(WeatherData.fromJson(jsonResponse['current']));
    return weatherDataList;
  } else {
    throw ServerRequestError(message: "Error occured");
  }
}

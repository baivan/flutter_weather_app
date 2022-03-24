import 'package:flutter/material.dart';

class WeatherLocation {
  final String city;
  final String weatherType;
  WeatherLocation(@required this.city, @required this.weatherType);
}

final locationList = [
  WeatherLocation('Kolkata', 'night'),
  WeatherLocation('London', 'sunny'),
  WeatherLocation('Nairobi', 'cloudy'),
  WeatherLocation('Kisumu', 'rainy'),
  WeatherLocation('Meru', 'cloudy'),
];

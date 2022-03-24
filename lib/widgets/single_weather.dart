import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/data/weather_api.dart';
import 'package:weatherapp/models/weather_data.dart';

import '../utils.dart';

class SingleWeather extends StatefulWidget {
  final String city;

  SingleWeather({required this.city});

  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(widget.city),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            WeatherData weatherData = data[0];
            return Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 110.0,
                            ),
                            Text(
                              widget.city,
                              style: GoogleFonts.lato(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              dateToHumanFormat(weatherData.weatherTime),
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weatherData.tempC,
                              style: GoogleFonts.lato(
                                  fontSize: 84,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(children: [
                              Image.asset(
                                (weatherData.isDay > 0
                                    ? "assets/weather/day/" +
                                        weatherData.condition.icon
                                    : "assets/weather/night/" +
                                        weatherData.condition.icon),
                                height: 34,
                                width: 34,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                weatherData.isDay > 0 ? "Day" : "Night",
                                style: GoogleFonts.lato(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Wind",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  weatherData.windKPH.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "km/h",
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                    Container(
                                      height: 5,
                                      width: (weatherData.windKPH * 50 / 100),
                                      color: Colors.greenAccent,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Rain",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  weatherData.precipMM.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "%",
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                    Container(
                                      height: 5,
                                      width: (weatherData.precipMM * 50 / 100),
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Humidity",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  weatherData.humidity.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "%",
                                  style: GoogleFonts.lato(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                    Container(
                                      height: 5,
                                      width: (weatherData.humidity * 50 / 100),
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/models/weather_location.dart';
import 'package:weatherapp/widgets/single_weather.dart';
import 'package:weatherapp/widgets/slide_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  String weatherType = "night";

  _onPageChanged(int i) {
    setState(() {
      activeIndex = i;

      weatherType = locationList[i].weatherType.toLowerCase();
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: SvgPicture.asset("assets/images/menu.svg",
                  width: 30, height: 30, color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/" + weatherType + ".jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 114, left: 15),
              child: Row(
                children: [
                  for (var i = 0; i < locationList.length; i++)
                    SlideIndicator(isActive: i == activeIndex)
                ],
              ),
            ),
            PageView.builder(
                itemCount: locationList.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (ctx, i) {
                  return SingleWeather(city: locationList[i].city);
                })
          ],
        ),
      ),
    );
  }
}

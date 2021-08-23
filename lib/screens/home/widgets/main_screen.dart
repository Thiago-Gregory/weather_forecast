import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast/models/forecast.dart';
import 'package:weather_forecast/screens/home/widgets/weather.dart';
import 'package:weather_forecast/shared/find_icon.dart';

class MainScreen extends StatelessWidget {
  final Map data;

  const MainScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
              bottom: 36,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    this.data["city"],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    this.data["date"],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  SvgPicture.asset(
                    findIcon(this.data["condition_slug"]),
                    width: 50,
                  ),
                  Text(
                    "${this.data["temp"]}º",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    this.data["description"],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/vento.svg",
                      width: 50,
                    ),
                  ),
                  Text(
                    this.data["wind_speedy"],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: builder,
                      itemCount: this.data["forecast"].length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    Forecast forecast = Forecast(
      dayOfWeek: this.data["forecast"][index]["weekday"],
      iconWeather: findIcon(this.data["forecast"][index]["condition_slug"]),
      temperature: this.data["forecast"][index]["max"]
    );

    return Weather(forecast);
  }
}
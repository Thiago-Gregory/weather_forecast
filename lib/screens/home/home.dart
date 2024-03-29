import 'package:flutter/material.dart';
import 'package:weather_forecast/provider/weather_server.dart';
import 'package:weather_forecast/screens/home/widgets/main_screen.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext _, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: 
                  CircularProgressIndicator(),
              ),
            );
          default: 
            return MainScreen(
              data: snapshot.data["results"],
            );
        }
      },
    );
  }
}
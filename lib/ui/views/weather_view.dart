import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  String sky = "";
  String temperature = "";

  String name = "";

  Future<void> getWeather() async {
    final response =
        await Dio().get("https://www.el-tiempo.net/api/json/v2/provincias/01");

    setState(() {
      sky = response.data["ciudades"][0]["stateSky"]["description"] ?? "";
      temperature = response.data["ciudades"][0]["temperatures"]["max"] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    getWeather();
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Clima para hoy",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [Text(sky), Text(temperature + " C")],
          ),
        ),
      ],
    ));
  }
}

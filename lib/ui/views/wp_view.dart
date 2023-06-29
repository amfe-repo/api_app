import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WordPressView extends StatefulWidget {
  const WordPressView({super.key});

  @override
  State<WordPressView> createState() => _WordPressViewState();
}

class _WordPressViewState extends State<WordPressView> {
  List<Widget> data = [];

  Future<void> getWeather() async {
    final response = await Dio()
        .get("https://www.lifehack.org/wp-json/wp/v2/posts?per_page=3");

    setState(() {
      for (var element in response.data) {
        data.add(Card(
            child: Column(
          children: [
            element["title"]["rendered"],
            element["excerpt"]["rendered"]
          ],
        )));
      }
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
            children: data,
          ),
        ),
      ],
    ));
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AgeView extends StatefulWidget {
  const AgeView({super.key});

  @override
  State<AgeView> createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  int age = 0;
  String name = "";

  Future<void> getAge(String nameConsult) async {
    final response =
        await Dio().get("https://api.agify.io/?name=" + nameConsult);

    setState(() {
      age = response.data["age"] ?? 0;
    });
  }

  Icon generateAge() {
    if (age > 50) {
      return Icon(Icons.accessible);
    }

    if (age > 18) {
      return Icon(Icons.accessibility);
    }

    return Icon(Icons.baby_changing_station);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Escribe tu nombre",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextField(onChanged: (value) {
            setState(() {
              name = value.replaceAll(' ', '');
            });
          }),
        ),
        ElevatedButton(
            onPressed: () {
              getAge(name);
            },
            child: Text("Verificar edad")),
        Column(
          children: [Text("Su edad es: ${age}"), generateAge()],
        )
      ],
    ));
  }
}

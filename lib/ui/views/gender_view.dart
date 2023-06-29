import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GenderView extends StatefulWidget {
  const GenderView({super.key});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  String? gender;
  String name = "";

  Map<String, Icon> iconMap = {
    "male": const Icon(
      Icons.accessibility,
      color: Colors.blue,
    ),
    "female": const Icon(Icons.accessibility, color: Colors.pink),
  };

  Future<void> getGender(String nameConsult) async {
    final response =
        await Dio().get("https://api.genderize.io/?name=" + nameConsult);

    setState(() {
      gender = response.data["gender"];
    });
  }

  Icon? generateGenderIcon() {}

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
              getGender(name);
            },
            child: Text("Verificar genero")),
        iconMap[gender] ?? Text("Espero...")
      ],
    ));
  }
}

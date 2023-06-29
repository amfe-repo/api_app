import 'package:api_app/entities/widgets/custom_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UniversitiesView extends StatefulWidget {
  const UniversitiesView({super.key});

  @override
  State<UniversitiesView> createState() => _UniversitiesViewState();
}

class _UniversitiesViewState extends State<UniversitiesView> {
  dynamic uniList = [];
  String name = "";

  Future<void> getAge(String nameConsult) async {
    final response = await Dio()
        .get("http://universities.hipolabs.com/search?country=" + nameConsult);

    setState(() {
      uniList = response.data ?? [];
    });
  }

  List<CustomCard> generateCards() {
    List<CustomCard> list = [];

    for (var element in uniList) {
      list.add(CustomCard(
          element["name"], element["domains"], element["web_pages"]));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Nombre del pais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TextField(onChanged: (value) {
            setState(() {
              name = value;
            });
          }),
        ),
        ElevatedButton(
            onPressed: () {
              getAge(name);
            },
            child: Text("Verificar edad")),
        Column(
          children: generateCards(),
        )
      ],
    )));
  }
}

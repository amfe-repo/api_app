import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String title = "";
  String subtitle = "";
  List<Text> domains = [];
  List<Text> webPages = [];

  CustomCard(String pTitle, List<dynamic> pDomains, List<dynamic> pWebPages,
      {super.key}) {
    title = pTitle;
    domains = createTextList(pDomains);
    webPages = createTextList(pWebPages);
  }

  List<Text> createTextList(List<dynamic> list) {
    List<Text> listText = [];

    for (var element in list) {
      listText.add(Text(element));
    }

    return listText;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(title),
            subtitle: Column(children: [
              Column(
                children: domains,
              ),
              Column(
                children: webPages,
              )
            ]),
            leading: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}

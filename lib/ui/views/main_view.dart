import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Tu app de herramientas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Image.network(
            "https://static-00.iconduck.com/assets.00/toolbox-icon-2048x1466-ele8jh55.png"),
      ],
    ));
  }
}

import 'package:api_app/domain/routes/routes_list.dart';
import 'package:api_app/ui/views/main_view.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int actualIndex = 6;

  getItem() {
    try {
      return routerList[actualIndex];
    } catch (err) {
      return const MainView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getItem(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: actualIndex,
          onTap: (value) {
            setState(() {
              actualIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                activeIcon: Icon(Icons.abc),
                label: "Main"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                activeIcon: Icon(Icons.abc),
                label: "Gender"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                activeIcon: Icon(Icons.abc),
                label: "Age"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                activeIcon: Icon(Icons.abc),
                label: "Uni"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                activeIcon: Icon(Icons.abc),
                label: "Weat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                activeIcon: Icon(Icons.abc),
                label: "Word"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc), activeIcon: Icon(Icons.abc), label: "Me")
          ]),
    );
  }
}

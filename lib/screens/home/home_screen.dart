import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_world/screens/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World CI&T"),
        actions: [
          IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
          IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
          IconButton(icon: Icon(Icons.accessibility), onPressed: () {}),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Hello World! Lets Go CI&T' + homeController.nome),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_world/screens/home/home_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Página de Login', style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: TextField(
              onChanged: (value) {
                // homeController.nome = value;
              },
              decoration: InputDecoration(labelText: "Um texto qualquer"),
            ),
          ),
          RaisedButton(
            child: Text('Próxima Página'),
            onPressed: () => Navigator.pushNamed(context, '/tutorial'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // onPressed: () => Navigator.pushNamed(context, '/${homeController.nome}'),
        onPressed: () => {},
        //ou Modular.to.pushNamed
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
        //Não precisar de contexto para realizar a navegação
      navigatorKey: Modular.navigatorKey,
      //Passa a ser responsável pelas rotas e pelas injeções de dependência
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

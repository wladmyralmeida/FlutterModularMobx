import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_world/app/app_controller.dart';
import 'package:hello_world/screens/home/home_controller.dart';
import 'file:///C:/Users/wladmyr/AndroidStudioProjects/hello_world/lib/screens/home/home_screen.dart';
import 'file:///C:/Users/wladmyr/AndroidStudioProjects/hello_world/lib/screens/login/login_screen.dart';
import 'package:hello_world/screens/login/login_controller.dart';

class AppModule extends MainModule {
  @override
  //Array de injeção de dependências.
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => HomeController()),
      ];

  @override
  //Pages do app
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomeScreen()),
        ModularRouter('/login/', child: (_, args) => LoginScreen()),
      ];

  @override
  Widget get bootstrap => Container();
}

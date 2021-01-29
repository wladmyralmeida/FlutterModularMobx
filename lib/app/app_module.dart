// app_module.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_world/app/app_controller.dart';
import 'package:hello_world/app/app_widget.dart';
import 'package:hello_world/repositories/user_repository.dart';
import 'package:hello_world/screens/home/home_controller.dart';
import 'package:hello_world/screens/home/home_screen.dart';
import 'package:hello_world/screens/login/login_controller.dart';
import 'package:hello_world/screens/login/login_screen.dart';

// app_module.dart
class AppModule extends MainModule {

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
    Bind((i) => AppController(i.get())),
    Bind((i) => HomeController()),
    Bind((i) => LoginController()),
    Bind((i) => UserRepository(i.get())),
    Bind((i) => Dio()),
  ];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => HomeScreen()),
    ModularRouter('/login', child: (_, __) => LoginScreen()),
  ];

  // Provide the root widget associated with your module
  @override
  Widget get bootstrap => AppWidget();
}
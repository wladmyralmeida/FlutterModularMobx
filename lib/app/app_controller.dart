import 'package:hello_world/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final UserRepository repository;

  _AppControllerBase(this.repository);
}

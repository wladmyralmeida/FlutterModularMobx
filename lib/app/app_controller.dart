import 'package:hello_world/repositories/pokemon_repository.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final PokemonRepository repository;

  _AppControllerBase(this.repository);
}

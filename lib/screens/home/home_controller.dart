import 'package:hello_world/models/pokemon.dart';
import 'package:hello_world/repositories/pokemon_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final PokemonRepository repository;

  @observable
  ObservableFuture<List<Pokemon>> pokemons;

  @action
  fetchPokemons() {
    pokemons = repository.getAllPokemons().asObservable();
  }

  _HomeController(this.repository) {
    fetchPokemons();
  }
}

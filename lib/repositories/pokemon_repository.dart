import 'package:dio/dio.dart';
import 'package:hello_world/models/pokemon.dart';

class PokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  Future<List<Pokemon>> getAllPokemons() async {
    var response = await dio.get('/pokemon');

    //Converter array de json em um model
    List<Pokemon> list = [];

    Pokemon user;
    for (var json in (response.data['results'] as List)) {
      user = Pokemon(name: json['name']);
      list.add(user);
    }

    return list;
  }
}

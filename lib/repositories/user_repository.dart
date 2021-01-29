import 'package:dio/dio.dart';
import 'package:hello_world/models/user.dart';

class UserRepository {
  final Dio dio;

  UserRepository(this.dio);

  Future<List> getAllUsers() async {
    var response = await dio.get('/pokemon');

    //Converter array de json em um model
    List<Pokemon> list;

    Pokemon user;
    for (var json in (response.data['results'] as List)) {
      user = Pokemon(name: json['name']);
      list.add(user);
    }

    return list;
  }
}

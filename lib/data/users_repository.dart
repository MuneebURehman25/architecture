
import 'dart:convert';

import 'package:flutter_architecture/domain/entity/user.dart';
import 'package:flutter_architecture/data/user_json.dart';
import 'package:flutter_architecture/domain/repository/users_repository.dart';
import 'package:http/http.dart' as http show get;


class RestApiUsersRepository implements UserRepository {

  @override
  Future<List<User>> getUsers() async {

    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    return list.map((e) => UserJson.fromJson(e as Map<String, dynamic>).toDomain()).toList();
  }

}
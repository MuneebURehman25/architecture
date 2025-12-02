import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/domain/entity/user.dart';
import 'package:flutter_architecture/data/user_json.dart';
import 'package:flutter_architecture/domain/repository/users_repository.dart';
import 'package:http/http.dart' as http show get;

import '../domain/failure/users_list_failure.dart';

class RestApiUsersRepository implements UserRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "User-Agent":
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36",
        },
      );

      if (response.statusCode != 200) {
        throw Exception(
          "Failed to fetch users. Server returned: ${response.statusCode}",
        );
      }

      var list = jsonDecode(response.body) as List;
      //status code handling, Json parsing handling
      return right(
        list
            .map((e) => UserJson.fromJson(e as Map<String, dynamic>).toDomain())
            .toList(),
      );
    } catch (e) {
      return left(UsersListFailure(error: e.toString()));
    }
  }
}

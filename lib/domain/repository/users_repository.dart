import 'package:dartz/dartz.dart';

import '../entity/user.dart';
import '../failure/users_list_failure.dart';

abstract class UserRepository {

  Future<Either<UsersListFailure, List<User>>> getUsers();

}
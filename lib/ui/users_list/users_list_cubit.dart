import 'package:flutter_architecture/domain/repository/users_repository.dart';
import 'package:flutter_architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UsersListCubit extends Cubit<UsersListState>{
  final UserRepository usersRepository;
  UsersListCubit(this.usersRepository) : super(UsersListState.empty());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading : true));
    final users = await usersRepository.getUsers();
    emit(state.copyWith(users: users, isLoading : false));
  }

}
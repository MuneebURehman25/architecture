
import 'package:flutter_architecture/domain/entity/user.dart';

  class UsersListState {
    final List<User> users;
    final bool isLoading;
    const UsersListState({required this.users, required this.isLoading});

    factory UsersListState.empty() => const UsersListState(users: [],isLoading: false);

    UsersListState copyWith({List<User>? users, bool? isLoading}) => UsersListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading
    );

  }
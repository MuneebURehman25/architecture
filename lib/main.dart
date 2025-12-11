import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/users_repository.dart';
import 'package:flutter_architecture/domain/repository/users_repository.dart';
import 'package:flutter_architecture/navigator/app_navigator.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_navigator.dart';
import 'package:flutter_architecture/ui/users_list/users_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<UserRepository>(RestApiUsersRepository());
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersListCubit(getIt(), getIt())..fetchUsers(),
        ),
        BlocProvider(create: (context) => UserDetailCubit()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UsersListPage(initialParams: UsersListInitialParams()),
    );
  }
}

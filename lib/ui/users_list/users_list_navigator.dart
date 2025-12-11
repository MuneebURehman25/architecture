import 'package:flutter/material.dart';
import 'package:flutter_architecture/navigator/app_navigator.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_navigator.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_page.dart';

class UsersListNavigator with UserDetailRoute {
  UsersListNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin UsersListRoute {
  openUserList(UsersListInitialParams initialParams) {
    navigator.push(context, UsersListPage(initialParams: initialParams));
  }

  BuildContext get context;

  AppNavigator get navigator;
}

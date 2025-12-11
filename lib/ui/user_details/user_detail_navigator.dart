import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_page.dart';

import '../../navigator/app_navigator.dart';

class UserDetailNavigator {}

mixin UserDetailRoute {
  openUserDetail(UserDetailInitialParams initialParams) {
    navigator.push(context, UserDetailPage(initialParams: initialParams));
  }

  BuildContext get context;

  AppNavigator get navigator;
}

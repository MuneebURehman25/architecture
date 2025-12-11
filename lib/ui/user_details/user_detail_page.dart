import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_cubit.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/user.dart';

class UserDetailPage extends StatefulWidget {
  final UserDetailInitialParams initialParams;

  const UserDetailPage({super.key, required this.initialParams});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late UserDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    // TODO: fix this later
    cubit = BlocProvider.of<UserDetailCubit>(context);
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as UserDetailsState;
            return ListTile(
              title: Text(state.user.name),
              subtitle: Text(state.user.email),
            );
          },
        ),
      ),
    );
  }
}

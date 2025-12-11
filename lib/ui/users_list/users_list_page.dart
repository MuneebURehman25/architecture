import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_page.dart';
import 'package:flutter_architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_architecture/ui/widgets/user_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatefulWidget {
  final UsersListInitialParams initialParams;
  const UsersListPage({super.key,required this.initialParams});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {

  late UsersListCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<UsersListCubit>(context);
    cubit.navigator.context = context;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details List'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            final userState = state as UsersListState;
            return userState.isLoading
                ? CircularProgressIndicator()
                : ListView(
                    children: userState.users
                        .map(
                          (user) => UserCard(
                            user: user,
                            onTap: () => cubit.onTapUser(user)
                          ),
                        )
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}

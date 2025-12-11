import 'package:flutter_architecture/ui/user_details/user_detail_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserDetailCubit extends Cubit<UserDetailsState>{

  UserDetailCubit() : super(UserDetailsState.initial());

    void onInit(UserDetailInitialParams initialParams) => emit(state.copyWith(user: initialParams.user));

}
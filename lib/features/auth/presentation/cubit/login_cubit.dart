import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:task_pro_mina/features/auth/data/model/user_model.dart';
import 'package:task_pro_mina/features/auth/domain/entities/user_login.dart';
import 'package:task_pro_mina/features/auth/domain/usecase/get_user_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetUserLogin getUserLogin;
  LoginCubit(this.getUserLogin) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserModel? userModel;

  Future<void> loginUser() async {
    emit(LoginLoading());

    final result = await getUserLogin(RecommendationParameters(
        emailController.text, passwordController.text));
    result.fold((l) => emit(LoginError(l.message)), (r) {
      userModel =
          UserModel(id: r.id, name: r.name, email: r.email, token: r.token);
      emit(LoginSuccess(r));
    });
  }
}

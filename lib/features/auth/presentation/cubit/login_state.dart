part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserLogin user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class LoginError extends LoginState{
  final String messageError;

  const LoginError(this.messageError);

   @override
  List<Object> get props => [messageError];
}

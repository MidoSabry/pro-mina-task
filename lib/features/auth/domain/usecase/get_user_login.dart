import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_pro_mina/core/error/failure.dart';
import 'package:task_pro_mina/core/usecase/base_usecase.dart';
import 'package:task_pro_mina/features/auth/domain/entities/user_login.dart';
import 'package:task_pro_mina/features/auth/domain/repository/base_user_repository.dart';

class GetUserLogin extends BaseUseCase<UserLogin, RecommendationParameters> {
  final BaseUserRepository userRepository;

  GetUserLogin(this.userRepository);

  @override
  Future<Either<Failure, UserLogin>> call(
      RecommendationParameters parameters) async {
    return await userRepository.getLoggedInUser(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final String email;
  final String password;

  const RecommendationParameters(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

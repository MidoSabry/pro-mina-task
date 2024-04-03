import 'package:dartz/dartz.dart';
import 'package:task_pro_mina/core/error/exceptions.dart';
import 'package:task_pro_mina/core/error/failure.dart';
import 'package:task_pro_mina/features/auth/data/datasource/login_user_remote_data_source.dart';
import 'package:task_pro_mina/features/auth/domain/entities/user_login.dart';
import 'package:task_pro_mina/features/auth/domain/repository/base_user_repository.dart';
import 'package:task_pro_mina/features/auth/domain/usecase/get_user_login.dart';

class UserRepository extends BaseUserRepository {
  final BaseLoginUserRemoteDataSource baseLoginUserRemoteDataSource;

  UserRepository(this.baseLoginUserRemoteDataSource);

  @override
  Future<Either<Failure, UserLogin>> getLoggedInUser(
      RecommendationParameters parameters) async {
    try {
      final result = await baseLoginUserRemoteDataSource.loginUser(parameters);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}

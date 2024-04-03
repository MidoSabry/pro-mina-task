import 'package:dartz/dartz.dart';
import 'package:task_pro_mina/core/error/failure.dart';
import 'package:task_pro_mina/features/auth/domain/entities/user_login.dart';
import 'package:task_pro_mina/features/auth/domain/usecase/get_user_login.dart';

abstract class BaseUserRepository{
   Future<Either<Failure, UserLogin>> getLoggedInUser(RecommendationParameters parameters);
}
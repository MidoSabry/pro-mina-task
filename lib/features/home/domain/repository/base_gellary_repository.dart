import 'package:dartz/dartz.dart';
import 'package:task_pro_mina/core/error/failure.dart';
import 'package:task_pro_mina/features/home/domain/entities/gellary.dart';
import 'package:task_pro_mina/features/home/domain/usecase/get_gellary_usecase.dart';

abstract class BaseGellaryRepository {
  Future<Either<Failure, GellaryEntity>> getUserGellary(
      GellaryParameters parameters);
}

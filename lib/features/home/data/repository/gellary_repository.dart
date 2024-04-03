import 'package:dartz/dartz.dart';
import 'package:task_pro_mina/core/error/exceptions.dart';
import 'package:task_pro_mina/core/error/failure.dart';
import 'package:task_pro_mina/features/home/data/datasource/gellary_remote_data_source.dart';
import 'package:task_pro_mina/features/home/domain/entities/gellary.dart';
import 'package:task_pro_mina/features/home/domain/repository/base_gellary_repository.dart';
import 'package:task_pro_mina/features/home/domain/usecase/get_gellary_usecase.dart';

class GellaryRepository extends BaseGellaryRepository {
  BaseGellaryRemoteDataSource baseGellaryRemoteDataSource;
  GellaryRepository(this.baseGellaryRemoteDataSource);

  @override
  Future<Either<Failure, GellaryEntity>> getUserGellary(
      GellaryParameters parameters) async {
    try {
      final result = await baseGellaryRemoteDataSource.gellaryUser(parameters);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}

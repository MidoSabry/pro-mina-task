import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_pro_mina/core/error/failure.dart';
import 'package:task_pro_mina/core/usecase/base_usecase.dart';
import 'package:task_pro_mina/features/home/domain/entities/gellary.dart';
import 'package:task_pro_mina/features/home/domain/repository/base_gellary_repository.dart';

class GetGellaryUseCase extends BaseUseCase<GellaryEntity, GellaryParameters> {
  final BaseGellaryRepository gellaryRepository;

  GetGellaryUseCase(this.gellaryRepository);

  @override
  Future<Either<Failure, GellaryEntity>> call(
      GellaryParameters parameters) async {
    return await gellaryRepository.getUserGellary(parameters);
  }
}

class GellaryParameters extends Equatable {
  final String token;

  const GellaryParameters(this.token);

  @override
  List<Object> get props => [token];
}

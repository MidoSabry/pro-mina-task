part of 'gellary_cubit.dart';

sealed class GellaryState extends Equatable {
  const GellaryState();

  @override
  List<Object> get props => [];
}

final class GellaryInitial extends GellaryState {}

final class GellaryLoading extends GellaryState {}

final class GellarySuccess extends GellaryState {
  final GellaryEntity gellaryEntity;

  const GellarySuccess(this.gellaryEntity);

  @override
  List<Object> get props => [gellaryEntity];
}

final class GellaryError extends GellaryState {
  final String messageError;

  const GellaryError(this.messageError);

  @override
  List<Object> get props => [messageError];
}

final class PickImageLoadind extends GellaryState {}

final class PickImageSuccess extends GellaryState {}

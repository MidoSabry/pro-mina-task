import 'package:equatable/equatable.dart';

class GellaryEntity extends Equatable {
  final String status;
  final List images;

  const GellaryEntity({required this.status, required this.images});

  @override
  List<Object?> get props => [status, images];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final int id;
  final String name;
  final String email;
  final String token;
  UserLogin({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, token];
}

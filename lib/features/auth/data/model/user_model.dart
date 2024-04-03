import 'package:task_pro_mina/features/auth/domain/entities/user_login.dart';

class UserModel extends UserLogin {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["user"]["id"],
      name: json["user"]["name"],
      email: json["user"]["email"],
      token: json["token"]);
}

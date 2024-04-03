import 'package:task_pro_mina/features/home/domain/entities/gellary.dart';

class GellaryModel extends GellaryEntity {
  GellaryModel({required super.status, required super.images});

  factory GellaryModel.fromJson(Map<String, dynamic> json) => GellaryModel(
        status: json["status"],
        images: json["data"]["images"],
      );
}

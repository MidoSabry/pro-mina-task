import 'package:dio/dio.dart';
import 'package:task_pro_mina/core/error/exceptions.dart';
import 'package:task_pro_mina/core/network/api_constance.dart';
import 'package:task_pro_mina/core/network/error_message_model.dart';
import 'package:task_pro_mina/features/home/data/model/gellary_model.dart';
import 'package:task_pro_mina/features/home/domain/usecase/get_gellary_usecase.dart';

abstract class BaseGellaryRemoteDataSource {
  Future<GellaryModel> gellaryUser(GellaryParameters parameters);
}

class GellaryRemoteDataSource extends BaseGellaryRemoteDataSource {
  GellaryRemoteDataSource();

  @override
  Future<GellaryModel> gellaryUser(GellaryParameters parameters) async {
    final Dio dio = Dio();
    // Send the POST request with the request body
    final response = await dio.get(ApiConstance.gellaryApi,
        options:
            Options(headers: {"Authorization": "Bearer " + parameters.token}));

    // Check response status code
    if (response.statusCode == 200) {
      return GellaryModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}

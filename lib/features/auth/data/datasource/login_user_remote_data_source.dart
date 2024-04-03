import 'package:dio/dio.dart';
import 'package:task_pro_mina/core/error/exceptions.dart';
import 'package:task_pro_mina/core/network/api_constance.dart';
import 'package:task_pro_mina/core/network/error_message_model.dart';
import 'package:task_pro_mina/features/auth/data/model/user_model.dart';
import 'package:task_pro_mina/features/auth/domain/usecase/get_user_login.dart';

abstract class BaseLoginUserRemoteDataSource {
  Future<UserModel> loginUser(RecommendationParameters parameters);
}

class LoginUserRemoteDataSource extends BaseLoginUserRemoteDataSource {
  LoginUserRemoteDataSource();

  @override
  Future<UserModel> loginUser(RecommendationParameters parameters) async {
    try {
      // Define the request body as a Map
      final requestBody = {
        'email': parameters.email,
        'password': parameters.password,
      };

      final Dio dio = Dio();
      // Send the POST request with the request body
      final response = await dio.post(ApiConstance.loginApi, data: requestBody);

      // Check response status code
      if (response.statusCode == 200) {
        // Check if the response data contains the "token" key
        if (response.data.containsKey("token")) {
          // Successful login response
          return UserModel.fromJson(response.data);
        } else {
          // Invalid credentials response
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        // Handle other status codes (e.g., 404, 500, etc.)
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioError catch (e) {
      // Handle DioError
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;
        // Handle different status codes here
        if (statusCode == 401) {
          // Unauthorized
          throw ErrorMessageModel(statusMessage: responseData['message']);
        } else {
          // Other status codes
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(responseData));
        }
      } else {
        // No response received
        throw const ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: 'No response received'));
      }
    }
  }
}

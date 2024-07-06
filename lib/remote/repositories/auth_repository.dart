import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v2/remote/constants/app_constants.dart';
import 'package:v2/remote/constants/config_model.dart';
import 'package:v2/remote/dio/dio_client.dart';
import 'package:v2/remote/exception/api_error_handler.dart';
import 'package:v2/remote/interface/repo_inteface.dart';
import 'package:v2/remote/models/user_model.dart';
import 'package:v2/remote/response/api_response.dart';

class AuthRepo extends RepoAbstract {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});
  @override
  Future<ApiResponse> get() async {
    throw UnimplementedError();
  }

  Future<ApiResponse> login(UserModel c) async {
    try {
      Response response = await dioClient.post(
        BaseUrls.productionAPi + BaseUrls.login,
        data: c.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    try {
      await sharedPreferences.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }

  bool isLogin() {
    try {
      return sharedPreferences.get(AppConstants.token) != null ? true : false;
    } catch (e) {
      rethrow;
    }
  }

  bool logout() {
    try {
      sharedPreferences.remove(AppConstants.token);
      return sharedPreferences.get(AppConstants.token) == null ? true : false;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> register(UserModel c) async {
    try {
      Response response = await dioClient.post(
        BaseUrls.productionAPi + BaseUrls.register,
        data: c.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

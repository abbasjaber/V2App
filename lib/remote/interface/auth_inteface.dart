import 'package:v2/remote/response/api_response.dart';

abstract class AuthAbstract {
  Future<ApiResponse> login();
  Future<ApiResponse> register();
  Future<ApiResponse> logout();
}

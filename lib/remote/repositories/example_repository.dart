import 'package:dio/dio.dart';
import 'package:v2/remote/dio/dio_client.dart';
import 'package:v2/remote/exception/api_error_handler.dart';
import 'package:v2/remote/interface/repo_inteface.dart';
import 'package:v2/remote/response/api_response.dart';

class ExampleRepo extends RepoAbstract {
  final DioClient dioClient;
  Response? response;
  ExampleRepo({required this.dioClient});
  @override
  Future<ApiResponse> get() async {
    try {
      response = await dioClient.get("");
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

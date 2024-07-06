import 'package:dio/dio.dart';
import 'package:v2/remote/dio/dio_client.dart';
import 'package:v2/remote/exception/api_error_handler.dart';
import 'package:v2/remote/interface/home_inteface.dart';
import 'package:v2/remote/interface/repo_inteface.dart';
import 'package:v2/remote/response/api_response.dart';

class HomeRepos extends HomeAbstract {
  final DioClient dioClient;
  Response? response;
  HomeRepos({required this.dioClient});

  @override
  Future<ApiResponse> getCagtegories() async {
    try {
      response = await dioClient.get("http://192.168.1.6:3000/category");
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getEvents() async {
    try {
      response = await dioClient.get("http://192.168.1.6:3000/event");
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}

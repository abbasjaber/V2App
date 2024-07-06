import 'package:v2/remote/response/api_response.dart';

abstract class SearchAbstract {
  Future<ApiResponse> getCagtegories();
  Future<ApiResponse> getEvents();
  Future<ApiResponse> getSearch();
}

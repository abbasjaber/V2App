import 'package:v2/remote/response/api_response.dart';

abstract class HomeAbstract {
  Future<ApiResponse> getCagtegories();
  Future<ApiResponse> getEvents();
}

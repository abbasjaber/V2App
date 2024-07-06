import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:v2/remote/models/category_model.dart';
import 'package:v2/remote/models/event_model.dart';
import 'package:v2/remote/repositories/example_repository.dart';
import 'package:v2/remote/repositories/home_repository.dart';
import 'package:v2/remote/repositories/search_repository.dart';
import 'package:v2/remote/response/api_response.dart';
import 'package:v2/remote/response/response_model.dart';

class SearchProvider extends ChangeNotifier {
  ResponseModel? responseModel;
  ApiResponse? apiResponse;
  SearchRepos? searchRepos;
  SearchProvider({this.searchRepos});

  List<Categories>? _categories;
  List<Categories>? get categories => _categories;

  List<Event>? _event;
  List<Event>? get event => _event;

  Future<ResponseModel?> getCategories() async {
    apiResponse = await searchRepos!.getCagtegories();
    if (apiResponse!.response != null &&
        apiResponse!.response!.statusCode == 200) {
      _categories = apiResponse!.response!.data
          .map<Categories>((e) => Categories.fromJson(e))
          .toList();

      responseModel = ResponseModel(true, 'Success');
    } else {
      responseModel =
          ResponseModel(false, apiResponse!.response!.data['message']);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel?> getEvents() async {
    apiResponse = await searchRepos!.getEvents();
    if (apiResponse!.response != null &&
        apiResponse!.response!.statusCode == 200) {
      _event = apiResponse!.response!.data
          .map<Event>((e) => Event.fromJson(e))
          .toList();
      responseModel = ResponseModel(true, 'Success');
    } else {
      responseModel =
          ResponseModel(false, apiResponse!.response!.data['message']);
    }
    notifyListeners();
    return responseModel;
  }

    Future<ResponseModel?> getSearch() async {
    apiResponse = await searchRepos!.getSearch();
    if (apiResponse!.response != null &&
        apiResponse!.response!.statusCode == 200) {
      _event = apiResponse!.response!.data
          .map<Event>((e) => Event.fromJson(e))
          .toList();
      responseModel = ResponseModel(true, 'Success');
    } else {
      responseModel =
          ResponseModel(false, apiResponse!.response!.data['message']);
    }
    notifyListeners();
    return responseModel;
  }
}

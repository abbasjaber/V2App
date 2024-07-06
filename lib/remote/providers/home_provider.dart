import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:v2/remote/models/category_model.dart';
import 'package:v2/remote/models/event_model.dart';
import 'package:v2/remote/repositories/home_repository.dart';
import 'package:v2/remote/response/api_response.dart';
import 'package:v2/remote/response/response_model.dart';

class HomeProvider extends ChangeNotifier {
  ResponseModel? responseModel;
  ApiResponse? apiResponse;
  HomeRepos? homeRepos;
  HomeProvider({this.homeRepos});

  List<Categories>? _categories;
  List<Categories>? get categories => _categories;

  bool _isLoadingCategories = false;
  bool get isLoadingCategories => _isLoadingCategories;

  bool _isLoadingEvent = false;
  bool get isLoadingEvent => _isLoadingEvent;

  List<Event>? _event;
  List<Event>? get event => _event;

  Future<ResponseModel?> getCategories() async {
    _categories = [];
    _isLoadingCategories = true;
    apiResponse = await homeRepos!.getCagtegories();
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
    _isLoadingCategories = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel?> getEvents() async {
    _event = [];
    _isLoadingEvent = true;
    apiResponse = await homeRepos!.getEvents();
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

    _isLoadingEvent = false;
    notifyListeners();
    return responseModel;
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v2/remote/constants/app_constants.dart';
import 'package:v2/remote/constants/config_model.dart';
import 'package:v2/remote/dio/dio_client.dart';
import 'package:v2/remote/dio/logging_interceptor.dart';
import 'package:v2/remote/providers/auth_provider.dart';
import 'package:v2/remote/providers/example_provider.dart';
import 'package:v2/remote/providers/home_provider.dart';
import 'package:v2/remote/repositories/auth_repository.dart';
import 'package:v2/remote/repositories/example_repository.dart';
import 'package:v2/remote/repositories/home_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(BaseUrls.productionAPi, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository

  sl.registerLazySingleton(
      () => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  sl.registerLazySingleton(() => ExampleRepo(dioClient: sl()));
  sl.registerLazySingleton(() => HomeRepos(dioClient: sl()));

  // Providers
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => ExampleProvider(examoleRepo: sl()));
  sl.registerFactory(() => HomeProvider(homeRepos: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  sharedPreferences.setBool(AppConstants.push, true);
}

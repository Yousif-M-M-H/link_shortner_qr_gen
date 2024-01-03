import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:url_shortner/features/home/data/repos/home_repo_implement.dart';
import 'package:url_shortner/utils/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}

// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:library_app/Core/database/apis/apis_consumer.dart';
import 'package:library_app/Core/database/apis/dio_consumer.dart';
import '../../Features/home/data/repo/home_repo_imp.dart';

final getIt = GetIt.instance;

void setUpServerLocator() {
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(api: getIt.get<ApiConsumer>()),
  );
}

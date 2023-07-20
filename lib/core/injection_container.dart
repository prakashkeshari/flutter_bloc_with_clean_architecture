import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:test_app/core/network/network_api_calls.dart';
import 'package:test_app/core/network/network_info_impl.dart';
import 'package:test_app/core/network/network_api_call_impl.dart';
import 'package:test_app/data/repositories/post_repository_impl.dart';
import 'package:test_app/domain/repositories/post_repository.dart';
import 'package:test_app/domain/usecases/post_list_usecase.dart';
import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //network
  sl.registerSingleton<NetworkApiCalls>(NetworkApiCallsImpl());

  // common
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerFactory<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // repositories
  sl.registerFactory<PostRepository>(() => PostRepositoryImpl());

  // use cases
  sl.registerFactory(() => PostListUseCase(postRepository: sl()));
}

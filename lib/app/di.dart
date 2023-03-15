import 'package:api_mvvm/app/app_prefs.dart';
import 'package:api_mvvm/data/data_source/local_data_source.dart';
import 'package:api_mvvm/data/data_source/remote_data_source.dart';
import 'package:api_mvvm/data/network/app_api.dart';
import 'package:api_mvvm/data/network/dio_factory.dart';
import 'package:api_mvvm/data/network/network_info.dart';
import 'package:api_mvvm/data/repository/repository_implementer.dart';
import 'package:api_mvvm/domain/repository/repository.dart';
import 'package:api_mvvm/domain/use_cases/home_use_case.dart';
import 'package:api_mvvm/presentation/home/viewmodel/home_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(
      sharedPreferences: instance<SharedPreferences>(),
    ),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementer(
      internetConnectionChecker: InternetConnectionChecker(),
    ),
  );

  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(
      appPreferences: instance<AppPreferences>(),
    ),
  );

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(
      dio,
    ),
  );

  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(
      appServiceClient: instance<AppServiceClient>(),
    ),
  );

  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImplementer(
      sharedPreferences: instance<SharedPreferences>(),
    ),
  );

  instance.registerLazySingleton<Repository>(
    () => RepositoryImplementer(
        networkInfo: instance<NetworkInfo>(),
        remoteDataSource: instance<RemoteDataSource>(),
        localDataSource: instance<LocalDataSource>()),
  );
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(
        () => HomeUseCase(instance<Repository>()));
    instance.registerFactory<HomeViewModel>(
        () => HomeViewModel(instance<HomeUseCase>()));
  }
}

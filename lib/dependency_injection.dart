import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/get_weather/0_data/data_sources/get_current_weather_local_data_source.dart';
import 'package:weather_app/features/get_weather/0_data/data_sources/get_current_weather_remote_data_source.dart';
import 'package:weather_app/features/get_weather/0_data/repositories/get_current_weather_repository_impl.dart';
import 'package:weather_app/features/get_weather/1_domain/repositories/get_current_weather_repository.dart';
import 'package:weather_app/features/get_weather/1_domain/use_cases/get_current_weather_usecase.dart';

final sl = GetIt.I;

Future<void> init() async {
  //! Features - Get Weather
  // Application Layer

  // Domain Layer
  sl.registerFactory(() => GetCurrenWeatherUseCase(weatherRepository: sl()));

  // Data Layer
  sl.registerFactory<GetCurrentWeatherRepository>(
    () => GetCurrentWeatherRepositoryImpl(
      networkInfo: sl(),
      getCurrentWeatherRemoteDataSource: sl(),
      getCurrentWeatherLocalDataSource: sl(),
    ),
  );

  sl.registerFactory<GetCurrentWeatherRemoteDataSource>(
    () => GetCurrentWeatherRemoteDataSourceImpl(
      dio: sl(),
    ),
  );

  sl.registerFactory<GetCurrentWeatherLocalDataSource>(
    () => GetCurrentWeatherLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  // External
  sl.registerLazySingleton(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

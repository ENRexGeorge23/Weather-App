import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/get_weather/0_data/data_sources/get_current_weather_remote_datasource.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';
import 'package:weather_app/features/get_weather/1_domain/repositories/get_current_weather_repository.dart';

class GetCurrentWeatherRepositoryImpl implements GetCurrentWeatherRepository {
  final GetCurrentWeatherRemoteDataSource getCurrentWeatherRemoteDataSource;
  final NetworkInfo networkInfo;

  GetCurrentWeatherRepositoryImpl({
    required this.networkInfo,
    required this.getCurrentWeatherRemoteDataSource,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final weatherInformation =
            await getCurrentWeatherRemoteDataSource.getWeatherInfo(cityName);
        return Right(weatherInformation);
      } on ServerException {
        return const Left(ServerFailure('Server Failure'));
      }
    } else {
      return const Left(ServerFailure('No Internet Connection'));
    }
  }
}

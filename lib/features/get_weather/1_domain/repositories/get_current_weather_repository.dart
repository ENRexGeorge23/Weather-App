import 'package:dartz/dartz.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';
import 'package:weather_app/core/errors/failures.dart';

abstract class GetCurrentWeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}

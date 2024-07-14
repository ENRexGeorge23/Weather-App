import 'package:dartz/dartz.dart';
import 'package:weather_app/features/1_domain/entities/weather_entity.dart';
import 'package:weather_app/core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}

import 'package:dartz/dartz.dart';
import 'package:weather_app/1_domain/entities/weather.dart';
import 'package:weather_app/1_domain/failures/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}

import 'package:dartz/dartz.dart';
import 'package:weather_app/features/1_domain/entities/weather_entity.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/1_domain/repositories/weather_repository.dart';

class GetCurrenWeatherUseCase {
  final WeatherRepository weatherRepository;

  const GetCurrenWeatherUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherEntity>> execute(String cityName) async {
    return await weatherRepository.getCurrentWeather(cityName);
  }
}

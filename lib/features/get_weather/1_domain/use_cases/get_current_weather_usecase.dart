import 'package:dartz/dartz.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/get_weather/1_domain/repositories/get_current_weather_repository.dart';

class GetCurrentWeatherUseCase {
  final GetCurrentWeatherRepository weatherRepository;

  const GetCurrentWeatherUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherEntity>> execute(String cityName) async {
    return await weatherRepository.getCurrentWeather(cityName);
  }
}

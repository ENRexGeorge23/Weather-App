import 'package:dartz/dartz.dart';
import 'package:weather_app/1_domain/entities/weather.dart';
import 'package:weather_app/1_domain/failures/failures.dart';
import 'package:weather_app/1_domain/repositories/weather_repository.dart';

class GetCurrenWeatherUseCase {
  final WeatherRepository weatherRepository;

  const GetCurrenWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) async {
    return await weatherRepository.getCurrentWeather(cityName);
  }
}

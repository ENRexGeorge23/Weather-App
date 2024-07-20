import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final int cloudsAll;
  final String country;
  final int sunrise;
  final int sunset;
  final int cod;

  const WeatherEntity(
      {required this.cityName,
      required this.main,
      required this.description,
      required this.iconCode,
      required this.temperature,
      required this.tempMin,
      required this.tempMax,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.windDeg,
      required this.cloudsAll,
      required this.country,
      required this.sunrise,
      required this.sunset,
      required this.cod});

  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        tempMin,
        tempMax,
        feelsLike,
        pressure,
        humidity,
        windSpeed,
        windDeg,
        cloudsAll,
        country,
        sunrise,
        sunset,
        cod
      ];
}

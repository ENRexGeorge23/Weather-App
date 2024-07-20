import 'package:flutter/material.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';

class CurrentWeatherLoaded extends StatelessWidget {
  final WeatherEntity currentWeather;

  const CurrentWeatherLoaded({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(currentWeather.cityName),
          Text(currentWeather.temperature.toString()),
          Text(currentWeather.feelsLike.toString()),
          Text(currentWeather.description),
          Text(currentWeather.main),
          Text(currentWeather.country),
          Text(currentWeather.sunrise.toString()),
          Text(currentWeather.sunset.toString()),
          Text(currentWeather.humidity.toString()),
          Text(currentWeather.pressure.toString()),
          Text(currentWeather.windSpeed.toString()),
          Text(currentWeather.windDeg.toString()),
          Text(currentWeather.cloudsAll.toString()),
        ],
      ),
    );
  }
}

part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherEvent extends CurrentWeatherEvent {
  final String cityName;

  const GetCurrentWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}



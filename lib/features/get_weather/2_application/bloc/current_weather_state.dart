part of 'current_weather_bloc.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherInitialState extends CurrentWeatherState {}

class CurrentWeatherLoadingState extends CurrentWeatherState {}

class CurrentWeatherLoadedState extends CurrentWeatherState {
  final WeatherEntity weatherEntity;

  const CurrentWeatherLoadedState({required this.weatherEntity});

  @override
  List<Object> get props => [weatherEntity];
}

class CurrentWeatherError extends CurrentWeatherState {}

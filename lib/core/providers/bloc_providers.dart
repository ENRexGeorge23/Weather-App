import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/dependency_injection.dart';
import 'package:weather_app/features/get_weather/2_application/bloc/current_weather_bloc.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<CurrentWeatherBloc>(
      create: (context) => sl<CurrentWeatherBloc>(),
    ),
  ];
}

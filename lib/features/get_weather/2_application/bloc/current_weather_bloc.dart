import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';
import 'package:weather_app/features/get_weather/1_domain/use_cases/get_current_weather_usecase.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  CurrentWeatherBloc({
    required this.getCurrentWeatherUseCase,
  }) : super(CurrentWeatherInitialState()) {
    on<GetCurrentWeatherEvent>(getCurrentWeather);
  }

  FutureOr<void> getCurrentWeather(
      GetCurrentWeatherEvent event, Emitter<CurrentWeatherState> emit) async {
    emit(CurrentWeatherLoadingState());
    final result = await getCurrentWeatherUseCase.execute(event.cityName);

    result.fold(
      (failure) => emit(CurrentWeatherError()),
      (weatherEntity) =>
          emit(CurrentWeatherLoadedState(weatherEntity: weatherEntity)),
    );
  }
}

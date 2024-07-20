import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/dependency_injection.dart';
import 'package:weather_app/features/get_weather/2_application/bloc/current_weather_bloc.dart';
import 'package:weather_app/features/get_weather/2_application/pages/view_states/curent_weather_loaded.dart';

class CurrentWeatherScreenProvider extends StatelessWidget {
  const CurrentWeatherScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final currentWeatherBloc = sl<CurrentWeatherBloc>();

        currentWeatherBloc.add(const GetCurrentWeatherEvent('Cebu'));
        return currentWeatherBloc;
      },
      child: const CurrentWeatherScreen(),
    );
  }
}

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CurrentWeatherBloc, CurrentWeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CurrentWeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CurrentWeatherLoadedState) {
            return CurrentWeatherLoaded(
              currentWeather: state.weatherEntity,
            );
          } else if (state is CurrentWeatherError) {
            return const Center(
              child: Text('Error'),
            );
          }

          return const Center(
            child: Text('Current Weather Screen'),
          );
        },
      ),
    );
  }
}

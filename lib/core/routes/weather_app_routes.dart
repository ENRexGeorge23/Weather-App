import 'package:flutter/material.dart';
import 'package:weather_app/features/get_weather/2_application/pages/current_weather_screen.dart';

Map<String, WidgetBuilder> appRoutes() {
  return {
    '/current-weather': (context) => const CurrentWeatherScreenProvider(),
  };
}

import 'package:flutter/material.dart';
import 'package:weather_app/dependency_injection.dart' as sl;
import 'package:weather_app/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const WeatherApp());
}

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/features/get_weather/0_data/models/weather_model.dart';

abstract class GetCurrentWeatherLocalDataSource {
  Future<WeatherModel> getLastWeatherInfo();

  Future<void> cacheWeatherInfo(WeatherModel weatherInfoToCache);
}

const cachedWeatherInfo = 'CACHED_WEATHER_INFO';

class GetCurrentWeatherLocalDataSourceImpl
    implements GetCurrentWeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetCurrentWeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherModel> getLastWeatherInfo() {
    final jsonString = sharedPreferences.getString(cachedWeatherInfo);
    if (jsonString != null) {
      return Future.value(WeatherModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException('Cache Error');
    }
  }

  @override
  Future<void> cacheWeatherInfo(WeatherModel weatherInfoToCache) {
    return sharedPreferences.setString(
      cachedWeatherInfo,
      json.encode(weatherInfoToCache.toJson()),
    );
  }
}

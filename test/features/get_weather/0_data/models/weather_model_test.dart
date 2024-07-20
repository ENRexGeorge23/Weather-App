import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/features/get_weather/0_data/models/weather_model.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';

void main() {
  const testWeatherModel = WeatherModel(
    cityName: 'Cebu City',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    tempMin: 301.15,
    tempMax: 303.15,
    feelsLike: 302.28,
    pressure: 1009,
    humidity: 70,
    windSpeed: 3.09,
    windDeg: 80,
    cloudsAll: 20,
    country: 'PH',
    sunrise: 1626820000,
    sunset: 1626866000,
    cod: 200,
  );
  test(
    'should be a subclass of WeatherEntity',
    () async {
      // assert
      expect(testWeatherModel, isA<WeatherEntity>());
    },
  );

  test(
    'should return a valid model from json ',
    () async {
      // arange

      // act

      // assert
    },
  );
}

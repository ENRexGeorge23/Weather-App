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

  group('fromJson', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = {
          'name': 'Cebu City',
          'weather': [
            {
              'main': 'Clouds',
              'description': 'few clouds',
              'icon': '02d',
            }
          ],
          'main': {
            'temp': 302.28,
            'feels_like': 302.28,
            'temp_min': 301.15,
            'temp_max': 303.15,
            'pressure': 1009,
            'humidity': 70,
          },
          'wind': {
            'speed': 3.09,
            'deg': 80,
          },
          'clouds': {
            'all': 20,
          },
          'sys': {
            'country': 'PH',
            'sunrise': 1626820000,
            'sunset': 1626866000,
          },
          'cod': 200,
        };

        // act
        final result = WeatherModel.fromJson(jsonMap);

        // assert
        expect(result, testWeatherModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = testWeatherModel.toJson();

        // assert
        final expectedMap = {
          'name': 'Cebu City',
          'weather': [
            {
              'main': 'Clouds',
              'description': 'few clouds',
            }
          ],
          'main': {
            'temp': 302.28,
            'feels_like': 302.28,
            'temp_min': 301.15,
            'temp_max': 303.15,
            'pressure': 1009,
            'humidity': 70,
          },
          'wind': {
            'speed': 3.09,
            'deg': 80,
          },
          'clouds': {
            'all': 20,
          },
          'sys': {
            'country': 'PH',
            'sunrise': 1626820000,
            'sunset': 1626866000,
          },
          'cod': 200,
        };
        expect(result, expectedMap);
      },
    );
  });
}

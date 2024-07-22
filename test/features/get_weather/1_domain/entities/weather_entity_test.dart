import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';

void main() {
  group('WeatherEntity', () {
    const weatherEntity = WeatherEntity(
      cityName: 'London',
      main: 'Clouds',
      description: 'Scattered clouds',
      iconCode: '03d',
      temperature: 20.5,
      tempMin: 18.2,
      tempMax: 23.8,
      feelsLike: 21.0,
      pressure: 1012,
      humidity: 70,
      windSpeed: 5.6,
      windDeg: 240,
      cloudsAll: 40,
      country: 'GB',
      sunrise: 1634567890,
      sunset: 1634601234,
      cod: 200,
    );

    test('should have correct properties', () {
      expect(weatherEntity.cityName, 'London');
      expect(weatherEntity.main, 'Clouds');
      expect(weatherEntity.description, 'Scattered clouds');
      expect(weatherEntity.iconCode, '03d');
      expect(weatherEntity.temperature, 20.5);
      expect(weatherEntity.tempMin, 18.2);
      expect(weatherEntity.tempMax, 23.8);
      expect(weatherEntity.feelsLike, 21.0);
      expect(weatherEntity.pressure, 1012);
      expect(weatherEntity.humidity, 70);
      expect(weatherEntity.windSpeed, 5.6);
      expect(weatherEntity.windDeg, 240);
      expect(weatherEntity.cloudsAll, 40);
      expect(weatherEntity.country, 'GB');
      expect(weatherEntity.sunrise, 1634567890);
      expect(weatherEntity.sunset, 1634601234);
      expect(weatherEntity.cod, 200);
    });

    test('should create an instance of WeatherEntity', () {
      const weather = WeatherEntity(
        cityName: 'New York',
        main: 'Clouds',
        description: 'overcast clouds',
        iconCode: '04d',
        temperature: 20.5,
        tempMin: 18.0,
        tempMax: 22.0,
        feelsLike: 19.5,
        pressure: 1012,
        humidity: 75,
        windSpeed: 5.0,
        windDeg: 250,
        cloudsAll: 90,
        country: 'US',
        sunrise: 1622895600,
        sunset: 1622946000,
        cod: 200,
      );

      expect(weather.cityName, 'New York');
      expect(weather.main, 'Clouds');
      expect(weather.description, 'overcast clouds');
      expect(weather.iconCode, '04d');
      expect(weather.temperature, 20.5);
      expect(weather.tempMin, 18.0);
      expect(weather.tempMax, 22.0);
      expect(weather.feelsLike, 19.5);
      expect(weather.pressure, 1012);
      expect(weather.humidity, 75);
      expect(weather.windSpeed, 5.0);
      expect(weather.windDeg, 250);
      expect(weather.cloudsAll, 90);
      expect(weather.country, 'US');
      expect(weather.sunrise, 1622895600);
      expect(weather.sunset, 1622946000);
      expect(weather.cod, 200);
    });
    test('should have correct props list', () {
      expect(weatherEntity.props, [
        'London',
        'Clouds',
        'Scattered clouds',
        '03d',
        20.5,
        18.2,
        23.8,
        21.0,
        1012,
        70,
        5.6,
        240,
        40,
        'GB',
        1634567890,
        1634601234,
        200,
      ]);
    });
  });
}

import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String cityName,
    required String main,
    required String description,
    required String iconCode,
    required double temperature,
    required int pressure,
    required int humidity,
  }) : super(
          cityName: cityName,
          main: main,
          description: description,
          iconCode: iconCode,
          temperature: temperature,
          pressure: pressure,
          humidity: humidity,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      cityName: json['name'],
      temperature: json['main']['temp'],
      iconCode: json['weather'][0]['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weather': [
        {
          'main': main,
          'description': description,
        }
      ],
      'main': {
        'temp': temperature,
        'pressure': pressure,
        'humidity': humidity,
      },
      'name': cityName,
    };
  }
}

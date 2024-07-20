import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String cityName,
    required String main,
    required String description,
    required String iconCode,
    required double temperature,
    required double tempMin,
    required double tempMax,
    required double feelsLike,
    required int pressure,
    required int humidity,
    required double windSpeed,
    required int windDeg,
    required int cloudsAll,
    required String country,
    required int sunrise,
    required int sunset,
    required int cod,
  }) : super(
          cityName: cityName,
          main: main,
          description: description,
          iconCode: iconCode,
          temperature: temperature,
          tempMin: tempMin,
          tempMax: tempMax,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          windSpeed: windSpeed,
          windDeg: windDeg,
          cloudsAll: cloudsAll,
          country: country,
          sunrise: sunrise,
          sunset: sunset,
          cod: cod,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      iconCode: json['weather'][0]['icon'],
      windSpeed: json['wind']['speed'],
      windDeg: json['wind']['deg'],
      cloudsAll: json['clouds']['all'],
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      cod: json['cod'],
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
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      },
      'wind': {
        'speed': windSpeed,
        'deg': windDeg,
      },
      'clouds': {
        'all': cloudsAll,
      },
      'sys': {
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      },
      'name': cityName,
      'cod': cod,
    };
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/1_domain/entities/weather.dart';
import 'package:weather_app/1_domain/use_cases/get_current_weather.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrenWeatherUseCase getCurrenWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrenWeatherUseCase = GetCurrenWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityName: 'Cebu City',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testCityName = 'Cebu City';

  test(
    'should get current weather detail from the repository',
    () async {
      // arange
      when(mockWeatherRepository.getCurrentWeather(testCityName)).thenAnswer(
        (_) async => const Right(testWeatherDetail),
      );

      // act
      final result = await getCurrenWeatherUseCase.execute(testCityName);

      //assert
      expect(result, const Right(testWeatherDetail));
    },
  );
}

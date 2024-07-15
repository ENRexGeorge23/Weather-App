import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/get_weather/1_domain/entities/weather_entity.dart';
import 'package:weather_app/features/get_weather/1_domain/use_cases/get_current_weather_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrenWeatherUseCase getCurrenWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrenWeatherUseCase =
        GetCurrenWeatherUseCase(weatherRepository: mockWeatherRepository);
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

  group('GetCurrentWeatherUseCase', () {
    test(
      'should get current weather detail from the repository when execute is called and successful',
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

    test(
      'should return failure when execute is called and unsuccessful',
      () async {
        // arange
        when(mockWeatherRepository.getCurrentWeather(testCityName)).thenAnswer(
          (_) async => const Left(ServerFailure('Server Failure')),
        );

        // act
        final result = await getCurrenWeatherUseCase.execute(testCityName);

        // assert
        expect(result, const Left(ServerFailure('Server Failure')));
      },
    );
  });
}

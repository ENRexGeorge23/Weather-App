import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/features/get_weather/0_data/models/weather_model.dart';

abstract class GetCurrentWeatherRemoteDataSource {
  Future<WeatherModel> getWeatherInfo(String cityName);
}

class GetCurrentWeatherRemoteDataSourceImpl
    implements GetCurrentWeatherRemoteDataSource {
  final Dio dio;

  GetCurrentWeatherRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<WeatherModel> getWeatherInfo(String cityName) async {
    final String apiEndpointUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=cdffaa4cc6491debc7c970bbae3e8d3d';

    try {
      final response = await dio.get(apiEndpointUrl,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ));

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to fetch data');
      }
    } on DioException catch (e) {
      String errorDescription;
      if (e.response != null) {
        errorDescription = 'product.packaging : ${e.response?.data}';
      } else {
        errorDescription = 'Error: ${e.message}';
      }
      throw ServerException(errorDescription);
    }
  }
}

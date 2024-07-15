import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_app/features/get_weather/1_domain/repositories/get_current_weather_repository.dart';

@GenerateMocks(
  [GetCurrentWeatherRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}

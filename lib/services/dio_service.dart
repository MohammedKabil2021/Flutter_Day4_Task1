// DioService class
import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getWeather(String city) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=61524ebc2bc2229f4cc20f2cf11c7d35&units=metric',
      );
      return response.data; // Return the response data as a Map
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}

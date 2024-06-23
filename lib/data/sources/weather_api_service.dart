import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  final String apiKey = '705f1efda11028e01274d6cbc38b19c7';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http
        .get(Uri.parse('${baseUrl}weather?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> fetchForecast(String city) async {
    final response = await http.get(
        Uri.parse('${baseUrl}forecast?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}

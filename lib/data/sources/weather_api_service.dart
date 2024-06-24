import 'package:http/http.dart' as http;

class WeatherApiService {
  final String apiKey = '705f1efda11028e01274d6cbc38b19c7';
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/forecast';

  Future<http.Response> fetchWeather({required String city}) async {
    final url = Uri.parse('$baseUrl?q=$city&unit=metric&APPID=$apiKey');
    final getResponse = await http.get(url);

    return getResponse;
  }
}

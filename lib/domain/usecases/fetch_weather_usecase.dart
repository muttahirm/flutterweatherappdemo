import 'package:flutterweatherappdemo/core/abstractions/abstractions.dart';
import 'package:flutterweatherappdemo/domain/entities/entities.dart';
import 'package:flutterweatherappdemo/domain/repositories/weather_repository.dart';

class FetchWeatherUseCase
    implements BaseUseCase<CityWeather, FetchWeatherRequest> {
  final WeatherRepository weatherRepository;

  FetchWeatherUseCase(this.weatherRepository);

  @override
  Future<CityWeather> call({FetchWeatherRequest? parameters}) =>
      weatherRepository.fetchWeather(city: parameters!.city);
}

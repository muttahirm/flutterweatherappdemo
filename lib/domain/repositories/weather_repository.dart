import 'package:flutterweatherappdemo/core/abstractions/abstractions.dart';
import 'package:flutterweatherappdemo/domain/entities/entities.dart';

abstract class WeatherRepository extends BaseRepository {
  Future<CityWeather> fetchWeather({
    required String city,
  });
}

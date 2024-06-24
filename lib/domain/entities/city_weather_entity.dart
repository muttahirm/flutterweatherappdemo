import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'entities.dart';

part 'city_weather_entity.g.dart';

@JsonSerializable()
class CityWeather with EquatableMixin {
  final String cod;
  // final int message;
  final int? cnt;
  final List<ForcastList>? list;
  final City? city;

  const CityWeather({
    required this.cod,
    // required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory CityWeather.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherToJson(this);

  @override
  List<Object?> get props => [
        cod,
        // message,
        cnt,
        list,
        city,
      ];
}

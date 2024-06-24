import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class Weather with EquatableMixin {
  final int id;
  final String main;
  final String? dayOfWeek;
  final String description;
  final String icon;
  final double? temperature;
  final int? humidity;
  final int? pressure;
  final double? windSpeed;

  Weather({
    required this.id,
    required this.main,
    required this.dayOfWeek,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [
        dayOfWeek,
        description,
        icon,
        temperature,
        humidity,
        pressure,
        windSpeed,
      ];
}

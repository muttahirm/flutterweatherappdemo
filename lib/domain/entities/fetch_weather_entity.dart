import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_weather_entity.g.dart';

@JsonSerializable()
class FetchWeatherRequest with EquatableMixin {
  final String city;

  const FetchWeatherRequest({
    required this.city,
  });
  factory FetchWeatherRequest.fromJson(Map<String, dynamic> json) =>
      _$FetchWeatherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FetchWeatherRequestToJson(this);

  @override
  List<Object?> get props => [
        city,
      ];
}

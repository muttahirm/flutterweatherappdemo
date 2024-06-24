import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'entities.dart';

part 'city_entity.g.dart';

@JsonSerializable()
class City with EquatableMixin {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  const City(
      {required this.id,
      required this.name,
      required this.coord,
      required this.country,
      required this.population,
      required this.timezone,
      required this.sunrise,
      required this.sunset});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        timezone,
        sunrise,
        sunset,
      ];
}

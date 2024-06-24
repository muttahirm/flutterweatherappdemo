import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'clouds_entity.dart';
import 'main_entity.dart';
import 'sys_entity.dart';
import 'wind_entity.dart';
import 'weather_entity.dart';

part 'forecast_list_entity.g.dart';

@JsonSerializable()
class ForcastList with EquatableMixin {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  final String? dtTxt;

  const ForcastList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  factory ForcastList.fromJson(Map<String, dynamic> json) =>
      _$ForcastListFromJson(json);

  Map<String, dynamic> toJson() => _$ForcastListToJson(this);

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        sys,
        dtTxt,
      ];
}

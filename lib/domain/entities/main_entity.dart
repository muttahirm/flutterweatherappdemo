import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_entity.g.dart';

@JsonSerializable()
class Main with EquatableMixin {
  final double temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int humidity;
  final double? tempKf;

  const Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.seaLevel,
      required this.grndLevel,
      required this.humidity,
      required this.tempKf});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind_entity.g.dart';

@JsonSerializable()
class Wind with EquatableMixin {
  final double speed;
  final int deg;
  final double gust;

  const Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}

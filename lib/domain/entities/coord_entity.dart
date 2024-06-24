import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coord_entity.g.dart';

@JsonSerializable()
class Coord with EquatableMixin {
  final double lat;
  final double lon;

  const Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}

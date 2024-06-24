import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rain_entity.g.dart';

@JsonSerializable()
class Rain with EquatableMixin {
  final double d3h;

  const Rain({required this.d3h});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);

  @override
  List<Object?> get props => [
        d3h,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sys_entity.g.dart';

@JsonSerializable()
class Sys with EquatableMixin {
  final String pod;

  const Sys({required this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [
        pod,
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      dayOfWeek: json['dayOfWeek'] as String?,
      description: json['description'] as String,
      icon: json['icon'] as String,
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toInt(),
      pressure: (json['pressure'] as num?)?.toInt(),
      windSpeed: (json['windSpeed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'dayOfWeek': instance.dayOfWeek,
      'description': instance.description,
      'icon': instance.icon,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'windSpeed': instance.windSpeed,
    };

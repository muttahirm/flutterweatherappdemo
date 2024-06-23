class WeatherEntity {
  final String dayOfWeek;
  final String description;
  final String icon;
  final double temperature;
  final int humidity;
  final int pressure;
  final double windSpeed;

  WeatherEntity({
    required this.dayOfWeek,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });
}

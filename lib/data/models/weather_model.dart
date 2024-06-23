class Weather {
  final String description;
  final String icon;
  final double temperature;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final DateTime date;

  Weather({
    required this.description,
    required this.icon,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.date,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}

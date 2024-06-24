part of 'weather_cubit.dart';

class WeatherState with EquatableMixin {
  final WeatherStatus status;
  final String weekDay;
  final String dateToday;
  final String cityName;
  final double temparature;
  final String weather;
  final String weatherIcon;
  final List<ForcastList>? forcastList;
  final int humidity;
  final int pressure;
  final double wind;

  WeatherState({
    required this.status,
    required this.weekDay,
    required this.dateToday,
    required this.cityName,
    required this.temparature,
    required this.weather,
    required this.weatherIcon,
    required this.forcastList,
    required this.humidity,
    required this.pressure,
    required this.wind,
  });

  factory WeatherState.initial() => WeatherState(
        status: WeatherStatus.init,
        weekDay: '-',
        dateToday: '-',
        cityName: '-',
        temparature: 0,
        weather: '-',
        weatherIcon: '-',
        humidity: 0,
        pressure: 0,
        wind: 0,
        forcastList: [],
      );

  factory WeatherState.loading() => WeatherState(
        status: WeatherStatus.loading,
        weekDay: '-',
        dateToday: '-',
        cityName: '-',
        temparature: 0,
        weather: '-',
        weatherIcon: '-',
        humidity: 0,
        pressure: 0,
        wind: 0,
        forcastList: [],
      );

  factory WeatherState.loaded(
    String weekDay,
    String dateToday,
    String cityName,
    double temparature,
    String weather,
    String weatherIcon,
    int humidity,
    int pressure,
    double wind,
    List<ForcastList> forcastList,
  ) =>
      WeatherState(
        status: WeatherStatus.loaded,
        weekDay: weekDay,
        dateToday: dateToday,
        cityName: cityName,
        temparature: temparature,
        weather: weather,
        weatherIcon: weatherIcon,
        humidity: humidity,
        pressure: pressure,
        wind: wind,
        forcastList: forcastList,
      );

  WeatherState withRefresh(WeatherStatus status) => WeatherState(
        status: status,
        weekDay: weekDay,
        dateToday: dateToday,
        cityName: cityName,
        temparature: temparature,
        weather: weather,
        weatherIcon: weatherIcon,
        humidity: humidity,
        pressure: pressure,
        wind: wind,
        forcastList: forcastList,
      );

  WeatherState withStatus(WeatherStatus status) => WeatherState(
        status: status,
        weekDay: weekDay,
        dateToday: dateToday,
        cityName: cityName,
        temparature: temparature,
        weather: weather,
        weatherIcon: weatherIcon,
        humidity: humidity,
        pressure: pressure,
        wind: wind,
        forcastList: forcastList,
      );

  @override
  List<Object?> get props => [
        status,
        weekDay,
        dateToday,
        cityName,
        temparature,
        weather,
        weatherIcon,
        humidity,
        pressure,
        wind,
        forcastList,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherappdemo/core/constants/contants.dart';
import 'package:flutterweatherappdemo/domain/entities/entities.dart';
import 'package:flutterweatherappdemo/domain/usecases/fetch_weather_usecase.dart';

part 'weather_state.dart';

enum WeatherStatus { init, loading, loaded, refreshing, error }

class WeatherCubit extends Cubit<WeatherState> {
  final FetchWeatherUseCase _fetchWeatherUseCase;
  WeatherCubit(this._fetchWeatherUseCase) : super(WeatherState.initial());

  List<ForcastList> list = [];
  String cityName = '';

  void refreshWeather() async {
    emit(state.withStatus(WeatherStatus.refreshing));
    await Future.delayed(const Duration(milliseconds: 2000));
    fetchWeather(cityName);
  }

  void fetchNewCity(String city) {
    emit(state.withStatus(WeatherStatus.loading));
    fetchWeather(city);
  }

  void fetchWeather(String city) async {
    cityName = city;
    FetchWeatherRequest request = FetchWeatherRequest(city: city);
    emit(state.withStatus(WeatherStatus.loading));
    await Future.delayed(const Duration(milliseconds: 2000));
    CityWeather response = await _fetchWeatherUseCase.call(parameters: request);

    var code = response.cod;
    if (int.parse(code) == 200) {
      var date =
          DateTime.fromMillisecondsSinceEpoch(response.list![0].dt * 1000);
      String weekDay = Weekday.getWeekday(date.weekday);
      String dateNow =
          '${date.day} ${Month.getMonthName(date.month)} ${date.year}';
      cityName = response.city!.name;
      double currentTemparature = response.list![0].main.temp - kelvinConstant;
      String weather = response.list![0].weather[0].main;
      String weatherIcon = response.list![0].weather[0].icon;
      int humidity = response.list![0].main.humidity;
      int pressure = response.list![0].main.pressure;
      double wind = response.list![0].wind.speed;

      list = [];
      for (int index = 8; index < response.list!.length; index += 8) {
        list.add(response.list![index]);
        if (list.length == 5) {
          break;
        }
      }

      emit(WeatherState.loaded(
        weekDay,
        dateNow,
        cityName,
        currentTemparature,
        weather,
        weatherIcon,
        humidity,
        pressure,
        wind,
        list,
      ));
    } else {
      emit(state.withStatus(WeatherStatus.error));
    }
  }

  void updateWeatherForADay(int index) {
    ForcastList instance = list[index];
    var date = DateTime.fromMillisecondsSinceEpoch(instance.dt * 1000);
    String weekDay = Weekday.getWeekday(date.weekday);
    String dateNow =
        '${date.day} ${Month.getMonthName(date.month)} ${date.year}';

    double currentTemparature = instance.main.temp - kelvinConstant;
    String weather = instance.weather[0].main;
    String weatherIcon = instance.weather[0].icon;
    int humidity = instance.main.humidity;
    int pressure = instance.main.pressure;
    double wind = instance.wind.speed;
    emit(WeatherState.loaded(
      weekDay,
      dateNow,
      cityName,
      currentTemparature,
      weather,
      weatherIcon,
      humidity,
      pressure,
      wind,
      list,
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherappdemo/data/sources/weather_api_service.dart';
import 'package:flutterweatherappdemo/presentation/ui/screens/main_screen/main_weather_screen.dart';

import 'data/repository_implementations/repository_implementations.dart';
import 'domain/usecases/fetch_weather_usecase.dart';
import 'presentation/bloc/cubit/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<WeatherCubit>(
        create: (blocContext) => WeatherCubit(
          FetchWeatherUseCase(
            WeatherRepositoryImpl(
              WeatherApiService(),
            ),
          ),
        ),
        child: const WeatherScreen(),
      ),
      // home: const WeatherScreen(),
    );
  }
}

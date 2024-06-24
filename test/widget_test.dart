import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterweatherappdemo/presentation/bloc/cubit/weather_cubit.dart';
import 'package:flutterweatherappdemo/presentation/ui/screens/main_screen/main_weather_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:flutterweatherappdemo/domain/usecases/fetch_weather_usecase.dart';

// Mock class for FetchWeatherUseCase
class MockFetchWeatherUseCase extends Mock implements FetchWeatherUseCase {}

void main() {
  late MockFetchWeatherUseCase mockFetchWeatherUseCase;

  setUp(() {
    mockFetchWeatherUseCase = MockFetchWeatherUseCase();
  });

  // Widget createWidgetUnderTest() {
  //   return MaterialApp(
  //     home: BlocProvider(
  //       create: (context) => WeatherCubit(mockFetchWeatherUseCase),
  //       child: const WeatherScreen(),
  //     ),
  //   );
  // }

  testWidgets('finds a single widget widgets', (WidgetTester tester) async {
    // Create a mock WeatherCubit
    final mockWeatherCubit = WeatherCubit(mockFetchWeatherUseCase);

    // Provide the mock cubit to the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherCubit>(
          create: (_) => mockWeatherCubit,
          child: const WeatherScreen(),
        ),
      ),
    );

    // Look for the multiple single widgets widget
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}

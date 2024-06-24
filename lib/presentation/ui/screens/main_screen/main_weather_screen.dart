import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherappdemo/presentation/bloc/cubit/weather_cubit.dart';
import 'package:flutterweatherappdemo/presentation/ui/shared_widgets/spaces/spaces.dart';

import 'components/components.dart';
import 'components/weather_forcast.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    Future<void> refreshData() async {
      context.read<WeatherCubit>().refreshWeather();
    }

    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 48.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter City',
                        ),
                      ),
                    ),
                    const HorizotalSpace(spaceLength: 10),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<WeatherCubit>()
                            .fetchWeather(controller.text);
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
                if (state.status == WeatherStatus.init) const SizedBox.shrink(),
                if (state.status == WeatherStatus.loading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state.status == WeatherStatus.loaded) ...[
                  Expanded(
                    child: SizedBox(
                      child: RefreshIndicator(
                        onRefresh: refreshData,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const VerticalSpace(spaceLength: 48.0),
                              DayHeader(
                                day: state.weekDay,
                              ),
                              const VerticalSpace(spaceLength: 24),
                              WeatherCondition(
                                condition: state.weather,
                              ),
                              const VerticalSpace(spaceLength: 24),
                              WeatherIcon(
                                iconId: state.weatherIcon,
                              ),
                              Temparature(
                                temparature: state.temparature,
                              ),
                              const VerticalSpace(spaceLength: 24.0),
                              OtherMeasures(
                                measurementName: "Humidity",
                                amount: state.humidity,
                                symbol: "%",
                              ),
                              const Divider(),
                              OtherMeasures(
                                measurementName: "Pressure",
                                amount: state.pressure,
                                symbol: "hPa",
                              ),
                              const Divider(),
                              OtherMeasures(
                                measurementName: "Wind",
                                amount: state.wind.toInt(),
                                symbol: "km/h",
                              ),
                              const VerticalSpace(spaceLength: 24.0),
                              WeatherForcast(
                                forecastList: state.forcastList,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                if (state.status == WeatherStatus.refreshing)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state.status == WeatherStatus.error)
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<WeatherCubit>().fetchWeather('Berlin');
                            controller.text = 'Berlin';
                          },
                          child: const Text('Press to restart')),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

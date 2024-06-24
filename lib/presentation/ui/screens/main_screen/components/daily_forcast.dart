import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherappdemo/core/constants/contants.dart';
import 'package:flutterweatherappdemo/presentation/bloc/cubit/weather_cubit.dart';
import 'package:flutterweatherappdemo/presentation/ui/shared_widgets/spaces/spaces.dart';

class SingleDayForcastBox extends StatelessWidget {
  final int index;
  final String day;
  final String iconId;
  final double minimumTemparature;
  final double maximumTemparature;
  const SingleDayForcastBox({
    required this.day,
    required this.index,
    required this.iconId,
    required this.minimumTemparature,
    required this.maximumTemparature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<WeatherCubit>().updateWeatherForADay(index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 32.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(
            16.0,
          ),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        width: 152,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Icon(
                getWeatherIconData(iconId),
                size: 50,
              ),
            ),
            const VerticalSpace(spaceLength: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (minimumTemparature - kelvinConstant).toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          '°',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  ' / ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (maximumTemparature - kelvinConstant).toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          '°',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

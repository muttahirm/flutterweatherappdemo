import 'package:flutter/material.dart';
import 'package:flutterweatherappdemo/core/constants/contants.dart';
import 'package:flutterweatherappdemo/domain/entities/entities.dart';

import 'daily_forcast.dart';

class WeatherForcast extends StatelessWidget {
  final List<ForcastList>? forecastList;
  const WeatherForcast({
    required this.forecastList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          top: 24.0,
          bottom: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (forecastList == null) const SizedBox.shrink(),
            if (forecastList != null || forecastList!.isNotEmpty)
              for (int index = 0; index < forecastList!.length; index++)
                SingleDayForcastBox(
                  day: Weekday.getWeekday(DateTime.fromMillisecondsSinceEpoch(
                          forecastList![index].dt * 1000)
                      .weekday),
                  index: index,
                  iconId: forecastList![index].weather[0].icon,
                  minimumTemparature: forecastList![index].main.tempMin ??
                      forecastList![index].main.temp,
                  maximumTemparature: forecastList![index].main.tempMax ??
                      forecastList![index].main.temp,
                ),
            // SingleDayForcastBox(
            //   day: 'Friday',
            //   index: 1,
            //   iconId: '03d',
            //   minimumTemparature: 23,
            //   maximumTemparature: 25,
            // ),
            // SingleDayForcastBox(
            //   day: 'Friday',
            //   index: 1,
            //   iconId: '03d',
            //   minimumTemparature: 23,
            //   maximumTemparature: 25,
            // ),
            // SingleDayForcastBox(
            //   day: 'Friday',
            //   index: 1,
            //   iconId: '03d',
            //   minimumTemparature: 23,
            //   maximumTemparature: 25,
            // ),
            // SingleDayForcastBox(
            //   day: 'Friday',
            //   index: 1,
            //   iconId: '03d',
            //   minimumTemparature: 23,
            //   maximumTemparature: 25,
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterweatherappdemo/core/constants/weather_icons.dart';
import 'package:flutterweatherappdemo/presentation/ui/shared_widgets/spaces/spaces.dart';

class WeatherIcon extends StatelessWidget {
  final String iconId;
  const WeatherIcon({
    required this.iconId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Icon(
            getWeatherIconData(iconId),
            size: screenWidth * 0.5,
          ),
        ),
        const VerticalSpace(spaceLength: 64.0),
      ],
    );
  }
}

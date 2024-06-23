import 'package:flutter/material.dart';
import 'package:flutterweatherappdemo/core/constants/weather_icons.dart';
import 'package:flutterweatherappdemo/presentation/ui/shared_widgets/spaces/spaces.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DayHeader(
                day: "Friday",
              ),
              VerticalSpace(spaceLength: 24),
              WeatherCondition(
                condition: "Showers",
              ),
              VerticalSpace(spaceLength: 24),
              // weatherIcon(screenWidth, ),
              WeatherIcon(
                iconId: "03d",
              ),
              VerticalSpace(spaceLength: 48.0),
              Temparature(
                temparature: 20,
              ),
              VerticalSpace(spaceLength: 24.0),
              OtherMeasures(
                measurementName: "Humidity",
                amount: 67,
                symbol: "%",
              ),
              Divider(),
              OtherMeasures(
                measurementName: "Pressure",
                amount: 1009,
                symbol: "hPa",
              ),
              Divider(),
              OtherMeasures(
                measurementName: "Wind",
                amount: 23,
                symbol: "km/h",
              ),
              VerticalSpace(spaceLength: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherMeasures extends StatelessWidget {
  final String measurementName;
  final int amount;
  final String symbol;
  const OtherMeasures({
    required this.measurementName,
    required this.amount,
    required this.symbol,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          measurementName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          "$amount $symbol",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String iconId;
  const WeatherIcon({
    required this.iconId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Icon(
        getWeatherIconData(iconId),
        size: screenWidth * 0.5,
      ),
    );
  }
}

class WeatherCondition extends StatelessWidget {
  final String condition;
  const WeatherCondition({
    required this.condition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      condition,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class DayHeader extends StatelessWidget {
  final String day;
  const DayHeader({
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        day,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Temparature extends StatefulWidget {
  final int temparature;
  const Temparature({
    required this.temparature,
    super.key,
  });

  @override
  State<Temparature> createState() => _TemparatureState();
}

class _TemparatureState extends State<Temparature> {
  late bool _isToggled = false;
  late int temparature = widget.temparature;
  late String temparatureType = "C";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "$temparature°$temparatureType",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              const Text("C"),
              Switch(
                value: _isToggled,
                onChanged: (value) {
                  setState(() {
                    _isToggled = value;
                    if (_isToggled) {
                      print("Change to FT");
                      double temp = temparature / -17.22222;
                      temparature = temp.toInt();
                      temparatureType = "F";
                    } else {
                      print("Change to C");
                      temparature = widget.temparature;
                      temparatureType = "C";
                    }
                  });
                },
              ),
              const Text("F"),
            ],
          ),
        ),
      ],
    );
  }
}

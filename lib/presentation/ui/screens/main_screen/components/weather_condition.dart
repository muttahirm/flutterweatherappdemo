import 'package:flutter/material.dart';

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

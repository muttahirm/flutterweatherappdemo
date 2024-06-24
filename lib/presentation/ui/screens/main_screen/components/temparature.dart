import 'package:flutter/material.dart';

class Temparature extends StatefulWidget {
  final double temparature;
  const Temparature({
    required this.temparature,
    super.key,
  });

  @override
  State<Temparature> createState() => _TemparatureState();
}

class _TemparatureState extends State<Temparature> {
  bool _isToggled = false;
  String temparatureType = "C";

  double get convertedTemperature {
    if (_isToggled) {
      // Celsius to Fahrenheit conversion
      return widget.temparature * 9 / 5 + 32;
    } else {
      return widget.temparature;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "${convertedTemperature.toStringAsFixed(1)}°$temparatureType",
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
                    temparatureType = _isToggled ? "F" : "C";
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

import 'package:flutter/material.dart';

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

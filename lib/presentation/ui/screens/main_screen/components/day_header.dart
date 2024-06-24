import 'package:flutter/material.dart';

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

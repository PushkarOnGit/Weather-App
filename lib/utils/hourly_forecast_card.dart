import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {

  final String time;
  final IconData icon;
  final String temperature;

  const HourlyForecastCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Icon(icon, size: 32),
            SizedBox(height: 10),
            Text(temperature, style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}

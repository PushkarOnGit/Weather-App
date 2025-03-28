import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({super.key});

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
              '00:55',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Icon(Icons.cloud, size: 30),
            SizedBox(height: 10),
            Text('301.7', style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}

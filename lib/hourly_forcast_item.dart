import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String value;
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            // time
            Text(
              time,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            // cloud
            Icon(icon, size: 40),

            SizedBox(height: 12),
            // temp
            Text('$value°F', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

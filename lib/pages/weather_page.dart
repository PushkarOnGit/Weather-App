import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/additional_info_tile.dart';
import 'package:weather_app/utils/hourly_forecast_card.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '300°F',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
                          Text('Rain', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastCard(
                    time: '23:23',
                    icon: Icons.cloud,
                    temperature: '23',
                  ),
                  HourlyForecastCard(
                    time: '23:23',
                    icon: Icons.sunny,
                    temperature: '23',
                  ),
                  HourlyForecastCard(
                    time: '23:23',
                    icon: Icons.cloud,
                    temperature: '23',
                  ),
                  HourlyForecastCard(
                    time: '23:23',
                    icon: Icons.sunny,
                    temperature: '23',
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoTile(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '91.5',
                ),

                AdditionalInfoTile(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '95',
                ),

                AdditionalInfoTile(
                  icon: Icons.beach_access,
                  label: 'Air Pressure',
                  value: '100.5',
                ),
              ],
            ),
            SizedBox(height:60),
            Text('Made By Pushkar Jadhav'),
            Text('(^_^)'),
          ],
        ),
      ),
    );
  }
}

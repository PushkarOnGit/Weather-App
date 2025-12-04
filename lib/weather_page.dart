import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:weather_app/additional_info_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CARD
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('300°F', style: TextStyle(fontSize: 32)),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 14),
                          Text('Rain', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '13:13',
                    icon: Icons.cloud,
                    value: '300',
                  ),

                  HourlyForecastItem(
                    time: '13:13',
                    icon: Icons.cloud,
                    value: '300',
                  ),

                  HourlyForecastItem(
                    time: '13:13',
                    icon: Icons.cloud,
                    value: '300',
                  ),

                  HourlyForecastItem(
                    time: '13:13',
                    icon: Icons.cloud,
                    value: '300',
                  ),

                  HourlyForecastItem(
                    time: '13:13',
                    icon: Icons.cloud,
                    value: '300',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoCard(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '01',
                ),

                AdditionalInfoCard(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '01',
                ),

                AdditionalInfoCard(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '01',
                ),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }
}

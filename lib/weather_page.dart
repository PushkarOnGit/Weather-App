import 'dart:ui';
import 'package:flutter/material.dart';

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
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
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
                AdditionalInfoCard(),
                AdditionalInfoCard(),
                AdditionalInfoCard(),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

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
              "13:13",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            // cloud
            Icon(Icons.cloud, size: 32),

            SizedBox(height: 12),
            // temp
            Text('300°F', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        Icon(Icons.water_drop_rounded, size: 60),
        SizedBox(height: 5),
        //Parameter name
        Text(
          'Humidity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        //value
        Text('94', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

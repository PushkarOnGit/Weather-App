import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:weather_app/additional_info_card.dart';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  //URI: Uniform resourse Identifier
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final String cityName = 'Nagpur';
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey",
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An Unexpected Error Occured';
      }

      return data;
    } catch (e) {
      throw 'An Unexpected Error Occured';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),

      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;

          final double currentTemp = data['list'][0]['main']['temp'];
          final currentState = data['list'][0]['weather'][0]['main'];
          final pressure = data['list'][0]['main']['pressure'];
          final windSpeed = data['list'][0]['wind']['speed'];
          final humidity = data['list'][0]['main']['humidity'];

          return Padding(
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
                              Text(
                                "${currentTemp}K",
                                style: TextStyle(fontSize: 32),
                              ),

                              Icon(
                                currentState == 'Clear'
                                    ? Icons.wb_sunny_outlined
                                    : Icons.cloud_queue,
                                size: 64,
                              ),
                              SizedBox(height: 14),
                              Text(
                                currentState,
                                style: TextStyle(fontSize: 20),
                              ),
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
                      value: humidity.toString(),
                    ),

                    AdditionalInfoCard(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: windSpeed.toString(),
                    ),

                    AdditionalInfoCard(
                      icon: Icons.beach_access,
                      label: 'Pressure',
                      value: pressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

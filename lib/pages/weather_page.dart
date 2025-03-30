import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/additional_info_tile.dart';
import 'package:weather_app/utils/hourly_forecast_card.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String cityName = 'Nagpur';
  final String apiKey = 'ea374b9bce7438cebb9a93780fbcf918';

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey",
        ),
      );

      final data = jsonDecode(response.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }


      return data;
    } catch (e) {
      if (e is http.ClientException || e is SocketException){
        throw "You're offline";
      }
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
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

          final currentWeather = data['list'][0]['main']['temp'];
          final currentSky = data['list'][0]['weather'][0]['main'];
          final airPressure = data['list'][0]['main']['pressure'];
          final windSpeed = data['list'][0]['wind']['speed'];
          final currentHumidity = data['list'][0]['main']['humidity'];

          return Padding(
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
                                '${(currentWeather - 273.15).toStringAsFixed(2)}°C',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              SizedBox(height: 16),
                              Text(currentSky, style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final hhmm = DateTime.parse(
                        data['list'][index + 1]['dt_txt'],
                      );
                      return HourlyForecastCard(
                        time: DateFormat('j').format(hhmm),
                        icon:
                            data['list'][index + 1]['weather'][0]['main'] ==
                                        'Clouds' ||
                                    data['list'][index +
                                            1]['weather'][0]['main'] ==
                                        'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                        temperature:
                            (data['list'][index + 1]['main']['temp'] - 273.15)
                                .toStringAsFixed(2) +
                            '°C',
                      );
                    },
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
                      value: currentHumidity.toString(),
                    ),

                    AdditionalInfoTile(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: windSpeed.toString(),
                    ),

                    AdditionalInfoTile(
                      icon: Icons.beach_access,
                      label: 'Air Pressure',
                      value: airPressure.toString(),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Text('Made By Pushkar Jadhav'),
                Text('(^_^)'),
              ],
            ),
          );
        },
      ),
    );
  }
}

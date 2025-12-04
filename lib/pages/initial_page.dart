import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.wb_sunny_outlined, size: 65),
            SizedBox(height: 40),

            //text
            Text('Enter The Name of your City', style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),

            //textfield
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'City',
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),

            SizedBox(height: 20),

            //button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => WeatherPage(cityName: controller.text),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

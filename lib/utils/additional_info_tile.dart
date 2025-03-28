import 'package:flutter/material.dart';

class AdditionalInfoTile extends StatelessWidget {
  const AdditionalInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.water_drop, size: 32,),
        SizedBox(height: 10,),
        Text('Humidity', style: TextStyle(color: Colors.grey),),
        SizedBox(height: 5,),
        Text('94.5', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
      ],
    );
  }
}

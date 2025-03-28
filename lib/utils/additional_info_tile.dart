import 'package:flutter/material.dart';

class AdditionalInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32,),
        SizedBox(height: 10,),
        Text(label, style: TextStyle(color: Colors.grey),),
        SizedBox(height: 5,),
        Text(value, style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
      ],
    );
  }
}

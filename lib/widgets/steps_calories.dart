import 'package:flutter/material.dart';

class StepsAndCalories extends StatelessWidget {
  const StepsAndCalories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:80.0),
      child: Row(
        children: [
          _infoCard(Icons.directions_walk_rounded, '5,430', 'STEPS'),
          SizedBox(width: 30),
          _infoCard(Icons.local_fire_department_rounded, '287', 'CALORIES'),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.black ),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}

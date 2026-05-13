import 'package:flutter/material.dart';

class AdditionalItems extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const AdditionalItems({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(label),
      ],
    );
  }
}

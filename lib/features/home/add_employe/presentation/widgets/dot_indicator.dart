import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final String text;
  final Color color;
  const DotIndicator({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

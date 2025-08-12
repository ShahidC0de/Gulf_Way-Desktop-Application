import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

class Customfield extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String labelText;
  const Customfield({
    super.key,
    required this.icon,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,

      textCapitalization: TextCapitalization.characters, // all caps
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required field';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.darkBlue),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

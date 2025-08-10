import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

class CustomDropdownField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final SingleValueDropDownController controller;
  final List<DropDownValueModel> items;
  final Function(dynamic) onChanged;

  const CustomDropdownField({
    super.key,
    required this.icon,
    required this.labelText,
    required this.controller,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      controller: controller,
      clearOption: true,
      enableSearch: true,
      dropDownItemCount: items.length,
      dropDownList: items,
      onChanged: onChanged,
      searchDecoration: const InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      clearIconProperty: IconProperty(color: Colors.green),
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      textFieldDecoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.darkBlue),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return "Required field";
        }
        return null;
      },
    );
  }
}

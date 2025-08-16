import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;
  double width;
  double height;

  CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.width = 255,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkBlue,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          fixedSize: Size(width, height),
        ),
        child: Text(buttonTitle),
      ),
    );
  }
}
